require 'spec_helper'
require 'parslet/rig/rspec'

describe Murtan::Parser do
  let(:parser) { described_class.new }

  context "address" do
    subject { parser.address }

    it { should parse("1.2.3.4").
      as(:first => '1', :second => '2', :third => '3', :fourth => '4') }
  end
end
