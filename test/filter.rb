class Murtan_TestFilter < Test::Unit::TestCase
  def test_filter_direction_and_interface_only
    data = Parser.new.parse("pass in on lo")
    assert_equal ["-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT",
        "-A INPUT -i lo -m state --state NEW -j ACCEPT"], data.to_iptables
  end

  def test_filter_and_direction_only
    data = Parser.new.parse("block in")
    assert_equal ["-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT",
      "-A INPUT -j REJECT"], data.to_iptables
  end

  def test_no_state
    data = Parser.new.parse("pass in on lo no state")
    assert_equal ["-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT",
      "-A INPUT -i lo -j ACCEPT"], data.to_iptables
  end
#    pass in on lo
#    pass in log on { eth0 eth2 } proto { tcp icmp } from { 1.2.3.4/24 } port { 22 21 } to port 22
#    block drop out on $bar proto { tcp udp } from 10.0.0.1 port { 80 443 } no state
#    block in proto tcp from any to any port 22
#    block in
end
