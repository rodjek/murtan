#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require 'lexer'
  require 'nodes'

class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 196)
  def parse(code, show_tokens=false)
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
    27,    57,    28,    29,    30,     2,     2,    44,    54,    82,
    90,    87,    78,    52,    64,    59,    88,    53,    23,    56,
    24,    18,    49,    34,    58,    11,    37,     3,     3,    43,
    81,    89,    77,    27,    63,    28,    29,    30,    47,    42,
    17,    48,    35,    71,    36,    65,    10,     8,    69,    12,
    66,    23,    70,    24,    62,    40,    75,    76,    45,    14,
    68,    38,    72,    15,    31,    79,    21,    83,    84,    85,
    19,    50 ]

racc_action_check = [
    25,    51,    25,    25,    25,    13,     0,    38,    45,    73,
    86,    80,    68,    45,    56,    53,    80,    45,    25,    46,
    25,    11,    41,    25,    51,     3,    31,    13,     0,    38,
    73,    86,    68,    17,    56,    17,    17,    17,    41,    36,
    11,    41,    31,    62,    31,    60,     2,     2,    62,     5,
    60,    17,    62,    17,    55,    36,    67,    67,    39,     6,
    61,    32,    63,     9,    22,    70,    16,    75,    76,    77,
    12,    43 ]

racc_action_pointer = [
     4,   nil,    36,    -1,   nil,    49,    53,   nil,   nil,    60,
   nil,    13,    70,     3,   nil,   nil,    53,    28,   nil,   nil,
   nil,   nil,    52,   nil,   nil,    -5,   nil,   nil,   nil,   nil,
   nil,    17,    44,   nil,   nil,   nil,    30,   nil,     2,    44,
   nil,    13,   nil,    66,   nil,   -10,     4,   nil,   nil,   nil,
   nil,    -4,   nil,    -8,   nil,    38,     7,   nil,   nil,   nil,
    22,    45,    25,    55,   nil,   nil,   nil,    36,     5,   nil,
    42,   nil,   nil,     2,   nil,    45,    46,    62,   nil,   nil,
   -12,   nil,   nil,   nil,   nil,   nil,     3,   nil,   nil,   nil,
   nil ]

racc_action_default = [
    -1,    -6,   -20,   -67,    -7,   -67,    -2,    -3,   -22,   -23,
   -21,   -67,   -67,    -5,    -8,   -24,   -25,   -67,    -9,    91,
    -4,   -26,   -27,   -16,   -18,   -67,   -11,   -14,   -15,   -17,
   -13,   -67,   -35,   -12,   -10,   -29,   -67,   -28,   -67,   -40,
   -32,   -67,   -31,   -67,   -36,   -44,   -47,   -34,   -30,   -33,
   -38,   -67,   -41,   -67,   -43,   -52,   -67,   -39,   -37,   -45,
   -67,   -59,   -56,   -67,   -48,   -46,   -42,   -64,   -67,   -53,
   -67,   -55,   -50,   -67,   -19,   -67,   -67,   -67,   -60,   -57,
   -67,   -49,   -51,   -65,   -66,   -62,   -67,   -58,   -54,   -61,
   -63 ]

racc_goto_table = [
     7,    26,    46,    13,    25,     6,     9,    16,    22,    33,
    32,    39,     5,    20,    55,    61,    67,    74,    41,    51,
    60,    73,    80,    86 ]

racc_goto_check = [
     3,     8,    14,     4,     7,     2,     9,    10,    11,     8,
    12,    13,     1,     3,    15,    16,    17,    18,    19,    20,
    21,    22,    23,    24 ]

racc_goto_pointer = [
   nil,    12,     5,     0,    -3,   nil,   nil,   -13,   -16,     4,
    -2,    -8,   -12,   -21,   -37,   -32,   -40,   -45,   -50,   -18,
   -24,   -33,   -42,   -48,   -54 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,     1,     4,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 30, :_reduce_1,
  1, 30, :_reduce_2,
  1, 31, :_reduce_3,
  3, 31, :_reduce_4,
  2, 31, :_reduce_5,
  1, 32, :_reduce_none,
  1, 32, :_reduce_none,
  1, 33, :_reduce_none,
  3, 35, :_reduce_9,
  5, 35, :_reduce_10,
  1, 36, :_reduce_11,
  2, 36, :_reduce_12,
  1, 37, :_reduce_13,
  1, 37, :_reduce_14,
  1, 37, :_reduce_15,
  1, 37, :_reduce_16,
  1, 37, :_reduce_17,
  1, 37, :_reduce_18,
  11, 34, :_reduce_19,
  0, 38, :_reduce_20,
  1, 38, :_reduce_21,
  1, 38, :_reduce_22,
  0, 39, :_reduce_23,
  1, 39, :_reduce_24,
  0, 40, :_reduce_25,
  1, 40, :_reduce_26,
  0, 41, :_reduce_27,
  2, 41, :_reduce_28,
  2, 41, :_reduce_29,
  4, 41, :_reduce_30,
  1, 48, :_reduce_31,
  1, 48, :_reduce_32,
  2, 48, :_reduce_33,
  2, 48, :_reduce_34,
  0, 42, :_reduce_35,
  2, 42, :_reduce_36,
  4, 42, :_reduce_37,
  1, 49, :_reduce_38,
  2, 49, :_reduce_39,
  0, 43, :_reduce_40,
  2, 43, :_reduce_41,
  4, 43, :_reduce_42,
  2, 43, :_reduce_43,
  1, 43, :_reduce_44,
  1, 50, :_reduce_45,
  2, 50, :_reduce_46,
  0, 44, :_reduce_47,
  2, 44, :_reduce_48,
  4, 44, :_reduce_49,
  1, 51, :_reduce_50,
  2, 51, :_reduce_51,
  0, 45, :_reduce_52,
  2, 45, :_reduce_53,
  4, 45, :_reduce_54,
  2, 45, :_reduce_55,
  1, 45, :_reduce_56,
  1, 52, :_reduce_57,
  2, 52, :_reduce_58,
  0, 46, :_reduce_59,
  2, 46, :_reduce_60,
  4, 46, :_reduce_61,
  1, 53, :_reduce_62,
  2, 53, :_reduce_63,
  0, 47, :_reduce_64,
  2, 47, :_reduce_65,
  2, 47, :_reduce_66 ]

racc_reduce_n = 67

racc_shift_n = 91

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
  :VARIABLE_NAME => 24,
  :VARIABLE => 25,
  "=" => 26,
  "{" => 27,
  "}" => 28 }

racc_nt_base = 29

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
  "VARIABLE_NAME",
  "VARIABLE",
  "\"=\"",
  "\"{\"",
  "\"}\"",
  "$start",
  "Root",
  "Expressions",
  "Expression",
  "Terminator",
  "Filter",
  "SetVariable",
  "StringList",
  "StringListItem",
  "BlockType",
  "Direction",
  "Log",
  "Interface",
  "Protocol",
  "From",
  "FromPort",
  "To",
  "ToPort",
  "State",
  "InterfaceList",
  "ProtocolList",
  "FromList",
  "FromPortList",
  "ToList",
  "ToPortList" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 43)
  def _reduce_1(val, _values, result)
     result = Nodes.new([]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 44)
  def _reduce_2(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 49)
  def _reduce_3(val, _values, result)
     result = Nodes.new(val) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 50)
  def _reduce_4(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 52)
  def _reduce_5(val, _values, result)
     result = Nodes.new([val[0]]) 
    result
  end
.,.,

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

module_eval(<<'.,.,', 'grammar.y', 67)
  def _reduce_9(val, _values, result)
     result = MurtanNode.set_variable(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 69)
  def _reduce_10(val, _values, result)
     result = MurtanNode.set_variable(val[0], val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 73)
  def _reduce_11(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 74)
  def _reduce_12(val, _values, result)
     result = val[0] << val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 78)
  def _reduce_13(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 79)
  def _reduce_14(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 80)
  def _reduce_15(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 81)
  def _reduce_16(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 82)
  def _reduce_17(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 83)
  def _reduce_18(val, _values, result)
     result = MurtanNode.get_variable(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 89)
  def _reduce_19(val, _values, result)
     result = FilterNode.new(val[0], val[1], val[2],
                                        val[3], val[4], val[5], val[6], val[7], 
                                        val[8], val[9], val[10]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 95)
  def _reduce_20(val, _values, result)
     result = :reject 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 96)
  def _reduce_21(val, _values, result)
     result = :reject 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 97)
  def _reduce_22(val, _values, result)
     result = :drop 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 101)
  def _reduce_23(val, _values, result)
     result = nil 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 102)
  def _reduce_24(val, _values, result)
     result = DirectionNode.new(val[0].to_sym) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 106)
  def _reduce_25(val, _values, result)
     result = false 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 107)
  def _reduce_26(val, _values, result)
     result = true 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 111)
  def _reduce_27(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 112)
  def _reduce_28(val, _values, result)
     result = [InterfaceNode.new(val[1])] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 113)
  def _reduce_29(val, _values, result)
     result = MurtanNode.get_variable(val[1]).to_a.map { |int| InterfaceNode.new(int) } 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 114)
  def _reduce_30(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 118)
  def _reduce_31(val, _values, result)
     result = [InterfaceNode.new(val[0])] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 119)
  def _reduce_32(val, _values, result)
     result = [InterfaceNode.new(MurtanNode.get_variable(val[0]))] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 120)
  def _reduce_33(val, _values, result)
     result = val[0] << InterfaceNode.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 121)
  def _reduce_34(val, _values, result)
     result = val[0] << InterfaceNode.new(MurtanNode.get_variable(val[1])) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 125)
  def _reduce_35(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 126)
  def _reduce_36(val, _values, result)
     result = [ProtocolNode.new(val[1])] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 127)
  def _reduce_37(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 131)
  def _reduce_38(val, _values, result)
     result = [ProtocolNode.new(val[0])] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 132)
  def _reduce_39(val, _values, result)
     result = val[0] << ProtocolNode.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 136)
  def _reduce_40(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 137)
  def _reduce_41(val, _values, result)
     result = [IPNode.new(val[1], :source)] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 138)
  def _reduce_42(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 139)
  def _reduce_43(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 140)
  def _reduce_44(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 144)
  def _reduce_45(val, _values, result)
     result = [IPNode.new(val[0], :source)] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 145)
  def _reduce_46(val, _values, result)
     result = val[0] << IPNode.new(val[1], :source) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 149)
  def _reduce_47(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 150)
  def _reduce_48(val, _values, result)
     result = [PortNode.new(val[1], :source)] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 151)
  def _reduce_49(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 155)
  def _reduce_50(val, _values, result)
     result = [PortNode.new(val[0], :source)] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 156)
  def _reduce_51(val, _values, result)
     result = val[0] << PortNode.new(val[1], :source) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 160)
  def _reduce_52(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 161)
  def _reduce_53(val, _values, result)
     result = [IPNode.new(val[1], :dest)] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 162)
  def _reduce_54(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 163)
  def _reduce_55(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 164)
  def _reduce_56(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 168)
  def _reduce_57(val, _values, result)
     result = [IPNode.new(val[0], :dest)] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 169)
  def _reduce_58(val, _values, result)
     result = val[0] << IPNode.new(val[1], :dest) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 173)
  def _reduce_59(val, _values, result)
     result = [BlankNode.new] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 174)
  def _reduce_60(val, _values, result)
     result = [PortNode.new(val[1], :dest)] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 175)
  def _reduce_61(val, _values, result)
     result = val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 179)
  def _reduce_62(val, _values, result)
     result = [PortNode.new(val[0], :dest)] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 180)
  def _reduce_63(val, _values, result)
     result = val[0] << PortNode.new(val[0], :dest) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 184)
  def _reduce_64(val, _values, result)
     result = true 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 185)
  def _reduce_65(val, _values, result)
     result = true 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 186)
  def _reduce_66(val, _values, result)
     result = false 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser
