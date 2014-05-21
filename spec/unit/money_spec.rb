require "spec_helper"

describe Money do
  context "adding money" do
    it "sum the money together" do
      result = Money.new(10.00) + Money.new(10.00)
      result.should == Money.new(20.00)
      result.should eql(Money.new(20.00))
    end
  end

  context "creating money" do
    it "can be created from a float" do
      10.00.dollars.should == Money.new(10.00)
    end
  end
end
