require "spec_helper"

describe Employee do
  let(:sut) { Employee.new }
  let(:today) { Clock.today }

  describe "#value_of_unvested_units_at" do
    context "when issued a grant that vests quarterly" do
      before :each do
        sut.issue_grant(80_000.dollars, 1.00.dollar)
      end

      context "before anything has vested" do
        let(:six_months_from_now) { today + (365/2) }

        before :each do
          Clock.stub(:now).and_return(six_months_from_now)
        end

        it "computes the value of the grant after 6 months" do
          sut.value_of(UnvestedUnits.new, 10.dollars).should == 800_000.dollars
        end
      end

      context "after one vesting period" do
        let(:one_year_from_now) { today + 365 }
        let(:portion_to_vest) { 1.0/4.0 }

        before :each do
          Clock.stub(:now).and_return(one_year_from_now)
          sut.grant_for(today).vest_at(10.dollars, portion_to_vest)
        end

        it "computes the correct value of unvested units" do
          sut.value_of(UnvestedUnits.new, 10.dollars).should == 600_000.dollars
        end
      end
    end
  end

  describe "#value_of_vested_units_at" do
    before :each do
      sut.issue_grant(80_000.dollars, 1.00.dollar)
    end

    context "after one vesting period" do
      let(:portion_to_vest) { 1.0/4.0 }

      before :each do
        sut.grant_for(today).vest_at(10.dollars, portion_to_vest)
      end

      it "computes the values of vested units after one vesting period" do
        sut.value_of(VestedUnits.new, 10.dollars).should == 200_000.dollars
      end
    end
  end
end
