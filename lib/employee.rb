class Employee
  def initialize
    @unvested_units = []
  end

  def issue_grant(value_of_grant, share_price)
    number_of_units = value_of_grant / share_price
    @unvested_units = [Unit.new] * number_of_units
  end

  def value_of_unvested_units_at(price)
    @unvested_units.inject(0.00.dollars) do |memo, unit|
      memo + (unit * price)
    end
  end
end
