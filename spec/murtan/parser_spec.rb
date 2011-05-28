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

    it { should parse('tcp').as(:protocol => 'tcp') }
    it { should parse('udp').as(:protocol => 'udp') }
    it { should parse('{ tcp udp }').as(
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

    it { should parse('eth0').as(:interface => 'eth0') }
    it { should parse('public').as(:interface => 'public') }
    it { should parse('{ eth0 eth1 }').as(
      :interface => [{:str => 'eth0'}, {:str => 'eth1'}]) }
  end
end
