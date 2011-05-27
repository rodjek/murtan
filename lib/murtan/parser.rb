require 'parslet'

module Murtan
  class Parser < Parslet::Parser
    rule(:integer)            { match('[0-9]') }
    rule(:period)             { str('.') }
    rule(:slash)              { str('/') }
    rule(:ip)                 { integer.repeat(1, 3) >> period >>
                                integer.repeat(1, 3) >> period >>
                                integer.repeat(1, 3) >> period >>
                                integer.repeat(1, 3) }
    rule(:netmask_or_masklen) { slash >> ip.as(:netmask) |
                                slash >> integer.repeat(1).as(:masklen) }
    rule(:address)            { ip.as(:ip) >> netmask_or_masklen.maybe }
  end
end
