require 'lexer'

code = <<-EOS
pass in log on eth0 ipv4 proto tcp from 192.168.100.0/24 port 1000 to 1.2.3.4 port 22 keep state
block in on eth1 proto tcp from { 10.0.0.0/24, \
  1.1.1.1 2.2.2.2 } 
EOS

p Lexer.new.tokenize(File.read("test_data"))
