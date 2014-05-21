require "spec_helper"

describe Employee do
  let(:sut) { Employee.new }

  context "when issued a grant that vests annually" do
    it "computes the value of the grant after 6 months" do
      sut.issue_grant(80_000.dollars, 1.00.dollar)
      current_price = 10.dollars
      sut.value_of_unvested_units_at(current_price)
    end

    it "computes the value of the grant after one year" do
      today = Clock.today
      sut.issue_grant(80_000, 1.00)
      Clock.stub(:now).and_return(1.year.from_now)
      sut.grant_for(today).vest_at(10.dollars)
      sut.unvested_units.value_at(10.dollars).should == 200_000
    end
  end
end
