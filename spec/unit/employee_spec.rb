require "spec_helper"

class Employee
  def initialize
  end

  def issue_grant(value_of_grant, share_price)
  end

  def value_of_unvested_grants_at(price)
    0.00
  end
end

describe Employee do
  let(:sut) { Employee.new }

  context "when issued a grant that vests annually" do
    it "computes the value of the grant after 6 months" do
      sut.issue_grant(80_000, 1.00)
      sut.value_of_unvested_grants_at(10.00).should == 0.00
    end
  end
end
