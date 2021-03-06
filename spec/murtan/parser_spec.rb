require 'spec_helper'
require 'parslet/rig/rspec'

describe Murtan::Parser do
  let(:parser) { described_class.new }

  context 'address' do
    subject { parser.address }

    it { should parse('1.2.3.4').as(:address => {:ip => '1.2.3.4'}) }
    it { should parse('1.2.3.0/24').as(
      :address => {:ip => '1.2.3.0', :masklen => '24'}) }
    it { should parse('1.2.3.0/255.255.255.0').as(
      :address => {:ip => '1.2.3.0', :netmask => '255.255.255.0'}) }
    it { should parse('{ 1.2.3.4 4.5.6.7 }').as(
      :address => [{:ip => '1.2.3.4'}, {:ip => '4.5.6.7'}]) }
    it { should parse('{ 1.2.3.4 10.0.0.0/24 }').as(
      :address => [{:ip => '1.2.3.4'},
                   {:ip => '10.0.0.0', :masklen => '24'}]) }
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

  context 'from' do
    subject { parser.from }

    it { should parse('from 192.168.0.1').as(
      :from => {:address => {:ip => '192.168.0.1'}}) }
    it { should parse('from 192.168.0.1 port 80').as(
      :from => {:address => {:ip => '192.168.0.1'}, :port => '80'}) }
  end

  context 'to' do
    subject { parser.to }

    it { should parse('to 192.168.0.1').as(
      :to => {:address => {:ip => '192.168.0.1'}}) }
    it { should parse('to 192.168.0.1 port 80').as(
      :to => {:address => {:ip => '192.168.0.1'}, :port => '80'}) }
  end

  context 'state' do
    subject { parser.state }

    it { should parse('keep state').as(:state => 'keep') }
    it { should parse('no state').as(:state => 'no') }
  end

  context 'filter' do
    subject { parser.filter }

    rule1 = 'pass out on eth0 proto tcp from 192.168.0.1 to 10.0.0.1 port 80 keep state'
    it { should parse(rule1).as(
      :filter => {
        :action => 'pass',
        :direction => 'out',
        :interface => 'eth0',
        :protocol => 'tcp',
        :from => {
          :address => {
            :ip => '192.168.0.1'
          }
        },
        :to => {
          :address => {
            :ip => '10.0.0.1'
          },
          :port => '80'
        },
        :state => 'keep'
      }
    ) }

    rule2 = 'block in reject on { eth0 eth1 } proto udp from { 10.0.0.0/24 10.0.1.0/255.255.255.0 } no state'
    it { should parse(rule2).as(
      :filter => {
        :action => 'block',
        :direction => 'in',
        :blocktype => 'reject',
        :interface => [
          {:str => 'eth0'},
          {:str => 'eth1'}
        ],
        :protocol => 'udp',
        :from => {
          :address => [
            {
              :ip => '10.0.0.0',
              :masklen => '24'
            },
            {
              :ip => '10.0.1.0',
              :netmask => '255.255.255.0'
            }
          ]
        },
        :state => 'no'
      }
    ) }
  end
end
