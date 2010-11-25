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
  ;

  # All tokens that can terminate an expression
  Terminator:
    NEWLINE
  ;

  # All hard-coded values
  Literal:
    NUMBER                        { result = LiteralNode.new(val[0]) }
  | STRING                        { result = LiteralNode.new(val[0]) }
  | IPADDRESS                     { result = LiteralNode.new(val[0]) }
  ;

  Filter:
    ACTION Direction Log          { result = FilterNode.new(val[0], val[1], val[2]) }
  ;

  Direction:
    /* nothing */                 { result = nil }
  | DIRECTION                     { result = DirectionNode.new(val[0]) }
  ;

  Log:
    /* nothing */                 { result = false }
  | LOG                           { result = true }
  ;

end

---- header
  require 'lexer'
  require 'nodes'

---- inner
  def parse(code, show_tokens=true)
    @tokens = Lexer.new.tokenize(code)
    puts @tokens.inspect if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end
