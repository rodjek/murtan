#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require 'lexer'
  require 'nodes'

class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 116)
  def parse(code, show_tokens=true)
    @tokens = Lexer.new.tokenize(code)
    puts @tokens.inspect if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end
...end grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    30,    26,    24,    18,    15,    13,     1,    12,     9,    20,
    22,     8,     7,    27,     1,   nil,   nil,    25,    17,   nil,
    29,    23 ]

racc_action_check = [
    28,    21,    20,    15,    11,     8,    10,     6,     3,    16,
    17,     2,     1,    23,     0,   nil,   nil,    21,    15,   nil,
    28,    20 ]

racc_action_pointer = [
    12,     9,    11,     2,   nil,   nil,    -6,   nil,     5,   nil,
     4,    -8,   nil,   nil,   nil,    -6,    -8,     1,   nil,   nil,
    -3,    -8,   nil,     8,   nil,   nil,   nil,   nil,    -5,   nil,
   nil ]

racc_action_default = [
    -1,   -12,   -26,    -2,    -3,    -6,   -14,   -13,   -26,    -7,
    -5,   -16,   -15,    31,    -4,   -26,   -21,   -26,   -17,   -11,
   -26,   -26,   -19,   -26,   -22,   -18,   -20,   -24,   -26,   -23,
   -25 ]

racc_goto_table = [
     4,    11,     2,    10,     6,     3,    16,    19,    21,    28,
    14 ]

racc_goto_check = [
     3,     8,     1,     4,     7,     2,     9,    10,    11,    12,
     3 ]

racc_goto_pointer = [
   nil,     2,     5,     0,     0,   nil,   nil,     3,    -5,    -5,
    -9,    -9,   -14 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,     5,   nil,   nil,   nil,   nil,
   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 27, :_reduce_1,
  1, 27, :_reduce_2,
  1, 28, :_reduce_3,
  3, 28, :_reduce_4,
  2, 28, :_reduce_5,
  1, 29, :_reduce_none,
  1, 30, :_reduce_none,
  1, 32, :_reduce_8,
  1, 32, :_reduce_9,
  1, 32, :_reduce_10,
  5, 31, :_reduce_11,
  0, 33, :_reduce_12,
  1, 33, :_reduce_13,
  0, 34, :_reduce_14,
  1, 34, :_reduce_15,
  0, 35, :_reduce_16,
  2, 35, :_reduce_17,
  4, 35, :_reduce_18,
  1, 37, :_reduce_19,
  2, 37, :_reduce_20,
  0, 36, :_reduce_21,
  2, 36, :_reduce_22,
  4, 36, :_reduce_23,
  1, 38, :_reduce_24,
  2, 38, :_reduce_25 ]

racc_reduce_n = 26

racc_shift_n = 31

racc_token_table = {
  false => 0,
  :error => 1,
  :ACTION => 2,
  :DIRECTION => 3,
  :AF => 4,
  :PROTOCOL => 5,
  :NEWLINE => 6,
  :NUMBER => 7,
  :STRING => 8,
  :IDENTIFIER => 9,
  :RETURN => 10,
  :DROP => 11,
  :ON => 12,
  :LOG => 13,
  :FROM => 14,
  :PORT => 15,
  :TO => 16,
  :PROTO => 17,
  :ANY => 18,
  :ALL => 19,
  :KEEP => 20,
  :NO => 21,
  :STATE => 22,
  :IPADDRESS => 23,
  "{" => 24,
  "}" => 25 }

racc_nt_base = 26

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "ACTION",
  "DIRECTION",
  "AF",
  "PROTOCOL",
  "NEWLINE",
  "NUMBER",
  "STRING",
  "IDENTIFIER",
  "RETURN",
  "DROP",
  "ON",
  "LOG",
  "FROM",
  "PORT",
  "TO",
  "PROTO",
  "ANY",
  "ALL",
  "KEEP",
  "NO",
  "STATE",
  "IPADDRESS",
  "\"{\"",
  "\"}\"",
  "$start",
  "Root",
  "Expressions",
  "Expression",
  "Terminator",
  "Filter",
  "Literal",
  "Direction",
  "Log",
  "Interface",
  "Protocol",
  "InterfaceList",
  "ProtocolList" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 41)
  def _reduce_1(val, _values, result)
     result = Nodes.new([]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 42)
  def _reduce_2(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 47)
  def _reduce_3(val, _values, result)
     result = Nodes.new(val) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 48)
  def _reduce_4(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 50)
  def _reduce_5(val, _values, result)
     result = Nodes.new([val[0]]) 
    result
  end
.,.,

# reduce 6 omitted

# reduce 7 omitted

module_eval(<<'.,.,', 'grammar.y', 65)
  def _reduce_8(val, _values, result)
     result = LiteralNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 66)
  def _reduce_9(val, _values, result)
     result = LiteralNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 67)
  def _reduce_10(val, _values, result)
     result = LiteralNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 72)
  def _reduce_11(val, _values, result)
     result = FilterNode.new(val[0], val[1], val[2],
                                        val[3], val[4]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 77)
  def _reduce_12(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 78)
  def _reduce_13(val, _values, result)
     result = DirectionNode.new(val[0].to_sym) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 82)
  def _reduce_14(val, _values, result)
     result = false 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 83)
  def _reduce_15(val, _values, result)
     result = true 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 87)
  def _reduce_16(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 88)
  def _reduce_17(val, _values, result)
     result = [InterfaceNode.new(val[1])] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 89)
  def _reduce_18(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 93)
  def _reduce_19(val, _values, result)
     result = [InterfaceNode.new(val[0])] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 94)
  def _reduce_20(val, _values, result)
     result = val[0] << InterfaceNode.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 98)
  def _reduce_21(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 99)
  def _reduce_22(val, _values, result)
     result = [ProtocolNode.new(val[1])] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 100)
  def _reduce_23(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 104)
  def _reduce_24(val, _values, result)
     result = [ProtocolNode.new(val[0])] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 105)
  def _reduce_25(val, _values, result)
     result = val[0] << ProtocolNode.new(val[1]) 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser
