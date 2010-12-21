class Parser

# Declare tokens produced by the lexer
token ACTION
token DIRECTION
token AF
token PROTOCOL
token NEWLINE
token NUMBER
token STRING
token IDENTIFIER
token RETURN
token DROP
token ON
token LOG
token FROM
token PORT
token TO
token PROTO
token ANY
token ALL
token KEEP
token NO
token STATE
token IPADDRESS
token VARIABLE_NAME
token VARIABLE

rule
  # All rules are declared in this format
  #
  #   RuleName:
  #     OtherRule TOKEN AnotherRule { code to run when this matches }
  #   | OtherRule                   { ... }
  #   ;
  #
  # In the code section (inside the {...} on the right):
  # - Assign to "result" the value returned by the rule
  # - Use val[index of expression] to reference expressions on the left


  # All parsing will end in this rule, being the trunk of the AST
  Root:
    /* nothing */                      { result = Nodes.new([]) }
  | Expressions                        { result = val[0] }
  ;

  # Any list of expressions, class or method body, separated by line breaks
  Expressions:
    Expression                         { result = Nodes.new(val) }
  | Expressions Terminator Expression  { result = val[0] << val[2] }
    # To ignore trailing line breaks
  | Expressions Terminator             { result = Nodes.new([val[0]]) }
  ;

  # All types of expressions in our language
  Expression:
    Filter
  | SetVariable
  ;

  # All tokens that can terminate an expression
  Terminator:
    NEWLINE
  ;

  SetVariable:
    VARIABLE_NAME "=" STRING      { result = MurtanNode.set_variable(val[0], val[2]) }
  | VARIABLE_NAME "=" 
    "{" StringList "}"            { result = MurtanNode.set_variable(val[0], val[3]) }
  | VARIABLE_NAME "=" VARIABLE    { result = MurtanNode.set_variable(val[0],
                                        MurtanNode.get_variable(val[2])) }
  ;

  StringList:
    StringListItem                { result = [val[0]] }
  | StringList StringListItem     { result = val[0] << val[1] }
  ;

  StringListItem:
    IDENTIFIER                    { result = val[0] }
  | PROTOCOL                      { result = val[0] }
  | NUMBER                        { result = val[0] }
  | IPADDRESS                     { result = val[0] }
  | STRING                        { result = val[0] }
  | VARIABLE                      { result = MurtanNode.get_variable(val[0]) }
  ;

  Filter:
    ACTION BlockType Direction Log 
      Interface Protocol From     
      FromPort To ToPort State    { result = FilterNode.new(val[0], val[1], val[2],
                                        val[3], val[4], val[5], val[6], val[7], 
                                        val[8], val[9], val[10]) }
  ;

  BlockType:
    /* nothing */                 { result = :reject }
  | RETURN                        { result = :reject }
  | DROP                          { result = :drop }
  ;

  Direction:
    /* nothing */                 { result = nil }
  | DIRECTION                     { result = DirectionNode.new(val[0].to_sym) }
  ;

  Log:
    /* nothing */                 { result = false }
  | LOG                           { result = true }
  ;

  Interface:
    /* nothing */                 { result = [BlankNode.new] }
  | ON IDENTIFIER                 { result = [InterfaceNode.new(val[1])] }
  | ON VARIABLE                   { result = MurtanNode.get_variable(val[1]).to_a.map { |int| InterfaceNode.new(int) } }
  | ON "{" InterfaceList "}"      { result = val[2] }
  ;

  InterfaceList:
    IDENTIFIER                    { result = [InterfaceNode.new(val[0])] }
  | VARIABLE                      { result = [InterfaceNode.new(MurtanNode.get_variable(val[0]))] }
  | InterfaceList IDENTIFIER      { result = val[0] << InterfaceNode.new(val[1]) }
  | InterfaceList VARIABLE        { result = val[0] << InterfaceNode.new(MurtanNode.get_variable(val[1])) }
  ;

  Protocol:
    /* nothing */                    { result = [BlankNode.new] }
  | PROTO PROTOCOL                   { result = [ProtocolNode.new(val[1])] }
  | PROTO "{" ProtocolList "}"       { result = val[2] }
  ;

  ProtocolList:
    PROTOCOL                      { result = [ProtocolNode.new(val[0])] }
  | ProtocolList PROTOCOL         { result = val[0] << ProtocolNode.new(val[1]) }
  ;

  From:
    /* nothing */                 { result = [BlankNode.new] }
  | FROM IPADDRESS                { result = [IPNode.new(val[1], :source)] }
  | FROM "{" FromList "}"         { result = val[2] }
  | FROM ANY                      { result = [BlankNode.new] }
  | FROM                          { result = [BlankNode.new] }
  ;

  FromList:
    IPADDRESS                     { result = [IPNode.new(val[0], :source)] }
  | FromList IPADDRESS            { result = val[0] << IPNode.new(val[1], :source) }
  ;

  FromPort:
    /* nothing */                 { result = [BlankNode.new] }
  | PORT NUMBER                   { result = [PortNode.new(val[1], :source)] }
  | PORT "{" FromPortList "}"     { result = val[2] }
  ;

  FromPortList:
    NUMBER                        { result = [PortNode.new(val[0], :source)] }
  | FromPortList NUMBER           { result = val[0] << PortNode.new(val[1], :source) }
  ;

  To:
    /* nothing */                 { result = [BlankNode.new] }
  | TO IPADDRESS                  { result = [IPNode.new(val[1], :dest)] }
  | TO "{" ToList "}"             { result = val[2] }
  | TO ANY                        { result = [BlankNode.new] }
  | TO                            { result = [BlankNode.new] }
  ;

  ToList:
    IPADDRESS                     { result = [IPNode.new(val[0], :dest)] }
  | ToList IPADDRESS              { result = val[0] << IPNode.new(val[1], :dest) }
  ;

  ToPort:
    /* nothing */                 { result = [BlankNode.new] }
  | PORT NUMBER                   { result = [PortNode.new(val[1], :dest)] }
  | PORT "{" ToPortList "}"       { result = val[2] }
  ;

  ToPortList:
    NUMBER                        { result = [PortNode.new(val[0], :dest)] }
  | ToPortList NUMBER             { result = val[0] << PortNode.new(val[0], :dest) }
  ;

  State:
    /* nothing */                 { result = true }
  | KEEP STATE                    { result = true }
  | NO STATE                      { result = false } 
  ;
end

---- header
  require 'lexer'
  require 'nodes'

---- inner
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.tokenize(code)
    puts @tokens.inspect if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end
