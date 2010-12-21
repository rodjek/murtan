require 'ipaddr'

# Collection of nodes each one representing an expression
class Nodes
  def initialize(nodes)
    @nodes = nodes
  end
  
  def <<(node)
    @nodes << node
    self
  end

  def to_iptables
    @nodes.compact.map { |node| node.to_iptables }.flatten.uniq
  end
end

class MurtanNode
  def self.set_variable(key, value)
    class_variable_set("@@#{key}".to_sym, value)
    nil
  end

  def self.get_variable(key)
    key_sym = "@@#{key}".to_sym
    if class_variable_defined? key_sym
      class_variable_get("@@#{key}".to_sym)
    else
      raise "Undefined variable $#{key} used.  Aborting"
    end
  end
end

# Literals are static values that have a Ruby representation. eg.: a string,
# a number, true, false, nil, etc.
class LiteralNode < MurtanNode
  def initialize(value)
    @value = value
  end
end

class FilterNode < MurtanNode
  def initialize(action, block_type, direction, log, interfaces, protocols, sources, sports, dests, dports, state)
    @action = action
    @block_type = block_type
    @direction = direction
    @log = log
    @interfaces = interfaces
    @protocols = protocols
    @sources = sources
    @sports = sports
    @dests = dests
    @dports = dports
    @state = state
  end

  def to_iptables
    if @action == "pass"
      chain = "ACCEPT"
    else
      chain = @block_type.to_s.upcase
    end

    rules = []

    has_state = false
    @interfaces.each do |int|
      @protocols.each do |proto|
        @sources.each do |src|
          @sports.each do |sport|
            @dests.each do |dest|
              @dports.each do |dport|
                rules << "#{@direction.to_iptables unless @direction.nil?}" +
                int.to_iptables(@direction.value) +
                "#{" -m state --state NEW" if @state and @action == "pass"}" +
                proto.to_iptables +
                src.to_iptables +
                dest.to_iptables +
                dport.to_iptables +
                sport.to_iptables +
                " -J #{chain}"
                if @state
                  has_state = true
                end
              end
            end
          end
        end
      end
    end
    ["-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT"] << rules
  end
end

class BlankNode < MurtanNode
  def to_iptables(*args)
    ""
  end
end

class DirectionNode < MurtanNode
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_iptables
    if @value == :in
      chain = "INPUT"
    elsif @value == :out
      chain = "OUTPUT"
    else
      raise "Invalid direction #{@value}"
    end
    "-A #{chain}"
  end
end

class InterfaceNode < MurtanNode
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_iptables(direction)
    if direction == :in
      " -i #{@value}"
    else
      " -o #{@value}"
    end
  end
end

class ProtocolNode < MurtanNode
  def initialize(value)
    @value = value
  end

  def to_iptables
    " -p #{@value}"
  end
end

class IPNode < MurtanNode
  def initialize(value, direction)
    data = value.split("/")
    ip = data.first
    if data.length > 1
      mask = data.last
    else
      mask = "32"
    end
    @ip = IPAddr.new(ip).mask(mask)
    @mask = IPAddr.new("255.255.255.255").mask(mask)
    @direction = direction
  end

  def to_iptables
    if @direction == :dest
      " -d #{@ip.to_s}/#{@mask.to_s}"
    elsif @direction == :source
      " -s #{@ip.to_s}/#{@mask.to_s}"
    else
      raise "Oh fuck"
    end
  end
end

class PortNode < MurtanNode
  def initialize(value, type)
    @value = value
    @type = type
  end

  def to_iptables
    if @type == :source
      " --sport #{@value}"
    elsif @type == :dest
      " --dport #{@value}"
    else
      raise "How'd you even get here?"
    end
  end
end
