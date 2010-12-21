#!/usr/bin/env ruby

require 'test/unit'
require 'parser'
require 'nodes'

class Murtan_TestVariables < Test::Unit::TestCase
  def test_set_single_variable
    foo = Parser.new.parse('var = "eth1"')
    assert_equal "eth1", MurtanNode.get_variable("var")
  end

  def test_set_multiple_variables
    foo = Parser.new.parse(<<-EOF
                           var1 = "eth1"
                           var2 = "eth2"
                           EOF
                          )
    assert_equal ["eth1", "eth2"], [MurtanNode.get_variable("var1"),
      MurtanNode.get_variable("var2")]
  end

  def test_set_array
    foo = Parser.new.parse('var1 = { eth3 eth2 }')
    assert_equal ["eth3", "eth2"], MurtanNode.get_variable("var1")
  end

  def test_set_variable_to_variable
    foo = Parser.new.parse(<<-EOF
                           var2 = "aoeui"
                           var1 = $var2
                           EOF
                          )
    assert_equal "aoeui", MurtanNode.get_variable("var1")
  end
end
