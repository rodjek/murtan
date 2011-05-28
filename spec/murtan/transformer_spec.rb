require 'spec_helper'

describe Murtan::Transformer do
  let(:transformer) { described_class.new }
  subject { transformer.apply(tree) }

  describe "string literals ({:str => 'foo'})" do
    let(:tree) { {:str => 'foo'} }

    it { should == 'foo' }
  end
end
