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
  def initialize(action, direction, log)
    @action = action
    @direction = direction
    @log = log
  end

  def to_iptables
    if @action == "pass"
      chain = "ACCEPT"
    else
      chain = "REJECT"
    end

    "#{@direction.to_iptables unless @direction.nil?}" +
    " -J #{chain}"
  end
end

class DirectionNode
  def initialize(value)
    @value = value
  end

  def to_iptables
    if @value == "in"
      chain = "INPUT"
    elsif @value == "out"
      chain = "OUTPUT"
    else
      raise "Invalid direction #{@value}"
    end
    "-A #{chain}"
  end
end
