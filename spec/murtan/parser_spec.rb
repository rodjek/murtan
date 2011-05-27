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
end
