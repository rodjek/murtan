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
    @nodes.map { |node| node.to_iptables }
  end
end

# Literals are static values that have a Ruby representation. eg.: a string,
# a number, true, false, nil, etc.
class LiteralNode
  def initialize(value)
    @value = value
  end
end

class FilterNode
  def initialize(action, direction, log, interfaces, protocols)
    @action = action
    @direction = direction
    @log = log
    @interfaces = interfaces
    @protocols = protocols
  end

  def to_iptables
    if @action == "pass"
      chain = "ACCEPT"
    else
      chain = "REJECT"
    end

    rules = []

    @interfaces.each do |int|
      @protocols.each do |proto|
        rules << "#{@direction.to_iptables unless @direction.nil?}" +
        "#{int.to_iptables(@direction.value)}" +
        proto.to_iptables +
        " -J #{chain}"
      end
    end
    rules
  end
end

class BlankNode
  def to_iptables(*args)
    ""
  end
end

class DirectionNode
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

class InterfaceNode
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

class ProtocolNode
  def initialize(value)
    @value = value
  end

  def to_iptables
    " -p #{@value}"
  end
end
