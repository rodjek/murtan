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
    rule(:protocol)           { str('proto') >> space >>
                                (protocols | protolist).as(:protocol) }

    #########################################################################
    # DIRECTION

    rule(:dir_in)             { str('in') }
    rule(:dir_out)            { str('out') }
    rule(:direction)          { (dir_in | dir_out).as(:direction) }

    #########################################################################
    # BLOCK TYPE

    rule(:reject)             { str('reject') }
    rule(:drop)               { str('drop') }
    rule(:blocktype)          { (reject | drop).as(:blocktype) }

    #########################################################################
    # ACTION

    rule(:pass)               { str('pass') }
    rule(:block)              { str('block') }
    rule(:action)             { (pass | block).as(:action) }

    #########################################################################
    # INTERFACE

    rule(:interface_name)    { match('[a-zA-Z0-9_-]').repeat(1) }
    rule(:interface_list)    { open_brace >> space >>
                               interface_name.as(:str) >>
                               (space >> interface_name.as(:str)).repeat >>
                               space >> close_brace }
    rule(:interface)         { (interface_name |
                                interface_list).as(:interface) }
  end
end
