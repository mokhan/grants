class Employee
  def initialize
    #@unvested_units = []
    @grants = []
  end

  def issue_grant(value_of_grant, share_price)
    #number_of_units = value_of_grant / share_price
    #@unvested_units = [Unit.new] * number_of_units
    @grants.push(Grant.new(value_of_grant, share_price))
  end

  def value_of_unvested_units_at(price)
    @grants.inject(0.00.dollars) do |memo, grant|
      memo + grant.value_of_unvested_units_at(price)
    end
  end

  def grant_for(date)
    @grants.find { |grant| grant.issued_at == date }
  end
end

class Grant
  attr_reader :issued_at

  def initialize(value_of_grant, share_price, date = Clock.today)
    number_of_units = value_of_grant / share_price
    @units = [Unit.new] * number_of_units
    @issued_at = date
  end

  def value_of_unvested_units_at(price)
    unvested_units.inject(0.00.dollars) do |memo, unit|
      memo + (unit * price)
    end
  end

  def vest_at(price, portion)
    number_of_units_to_vest = portion.to_f * @units.count
    @units.take(number_of_units_to_vest).each do |unit|
      unit.vest_at(price)
    end
  end

  private

  def value_of(units, price)
    units.inject(0.00.dollars) do |memo, unit|
      memo + (unit * price)
    end
  end

  def unvested_units
    @units - vested_units
  end

  def vested_units
    @units.find_all { |x| x.vested? }
  end
end
