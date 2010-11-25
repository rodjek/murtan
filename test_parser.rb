require 'parser.rb'

# pass in on eth0 proto tcp from { 10.0.0.0/24 1.2.3.4 } port 22 to any port 33 keep state
# block out log on eth1 from any to 10.0.0.1 port 1234 no state

code = <<-EOS
pass in log
block out
pass
EOS

foo = Parser.new.parse(code)
p foo.to_iptables
