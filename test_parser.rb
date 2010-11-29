#!/usr/bin/env ruby

`racc -o parser.rb grammar.y`

require 'parser'
require 'nodes'

code = <<-EOS
foo =  { "bar" 22 }

pass in on lo
pass in log on { eth0 eth2 } proto { tcp icmp } from { 1.2.3.4/24 } port { 22 21 } to port 22
block drop out on eth1 proto { tcp udp } from 10.0.0.1 port { 80 443 } no state
block in proto tcp from any to any port 22
block in
EOS

foo = Parser.new.parse(code)
p foo
foo.to_iptables.flatten.uniq.each { |rule| puts rule }
p MurtanNode.get_variable("foo")
