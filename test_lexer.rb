require 'lexer'

code = <<-EOS
foo = "eth1"

pass in log on eth0 ipv4 proto tcp from 192.168.100.0/24 port 1000 to 1.2.3.4 port 22 keep state
block in on $foo proto tcp from { 10.0.0.0/24, \
  1.1.1.1 2.2.2.2 } 
redirect in on eth1 from 1.2.3.3 port 22 to 192.168.0.1 port 80
EOS

p Lexer.new.tokenize(code)
