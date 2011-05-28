require 'parslet'

module Murtan
  class Parser < Parslet::Parser
    rule(:integer)            { match('[0-9]') }
    rule(:period)             { str('.') }
    rule(:slash)              { str('/') }
    rule(:open_brace)         { str('{') }
    rule(:close_brace)        { str('}') }
    rule(:space)              { str(' ') }

    #########################################################################
    # IP ADDRESS

    rule(:ip)                 { integer.repeat(1, 3) >> period >>
                                integer.repeat(1, 3) >> period >>
                                integer.repeat(1, 3) >> period >>
                                integer.repeat(1, 3) }
    rule(:netmask_or_masklen) { slash >> (ip.as(:netmask) |
                                integer.repeat(1).as(:masklen)) }
    rule(:address)            { ip.as(:ip) >> netmask_or_masklen.maybe }

    #########################################################################
    # PROTOCOL

    rule(:tcp)                { str('tcp') }
    rule(:udp)                { str('udp') }
    rule(:protocols)          { tcp | udp }
    rule(:protolist)          { open_brace >> space >> protocols.as(:str) >>
                                (space >> protocols.as(:str)).repeat >>
                                space >> close_brace }
    rule(:protocol)           { (protocols | protolist).as(:protocol) }
  end
end
