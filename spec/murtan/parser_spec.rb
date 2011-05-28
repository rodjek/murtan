require 'spec_helper'
require 'parslet/rig/rspec'

describe Murtan::Parser do
  let(:parser) { described_class.new }

  context 'address' do
    subject { parser.address }

    it { should parse('1.2.3.4').as(:ip => '1.2.3.4') }
    it { should parse('1.2.3.0/24').as(:ip => '1.2.3.0', :masklen => '24') }
    it { should parse('1.2.3.0/255.255.255.0').as(
      :ip => '1.2.3.0', :netmask => '255.255.255.0')}
  end

  context 'protocol' do
    subject { parser.protocol }

    it { should parse('proto tcp').as(:protocol => 'tcp') }
    it { should parse('proto udp').as(:protocol => 'udp') }
    it { should parse('proto { tcp udp }').as(
      :protocol => [{:str => 'tcp'}, {:str => 'udp'}]) }
  end

  context 'direction' do
    subject { parser.direction }

    it { should parse('in').as(:direction => 'in') }
    it { should parse('out').as(:direction => 'out') }
  end

  context 'blocktype' do
    subject { parser.blocktype }

    it { should parse('reject').as(:blocktype => 'reject') }
    it { should parse('drop').as(:blocktype => 'drop') }
  end

  context 'action' do
    subject { parser.action }

    it { should parse('pass').as(:action => 'pass') }
    it { should parse('block').as(:action => 'block') }
  end

  context 'interface' do
    subject { parser.interface }

    it { should parse('on eth0').as(:interface => 'eth0') }
    it { should parse('on public').as(:interface => 'public') }
    it { should parse('on { eth0 eth1 }').as(
      :interface => [{:str => 'eth0'}, {:str => 'eth1'}]) }
  end

  context 'port' do
    subject { parser.port }

    it { should parse('port 80').as(:port => '80') }
    it { should parse('port { 80 443 }').as(
      :port => [{:str => '80'}, {:str => '443'}]) }
  end
end
