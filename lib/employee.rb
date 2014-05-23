class Employee
  def initialize
    @grants = []
  end

  def issue_grant(value_of_grant, share_price)
    @grants.push(Grant.new(value_of_grant, share_price))
  end

  def value_of_unvested_units_at(price)
    @grants.inject(0.00.dollars) do |memo, grant|
      memo + grant.value_of_unvested_units_at(price)
    end
  end

  def value_of_vested_units_at(price)
    @grants.inject(0.00.dollars) do |memo, grant|
      memo + grant.value_of_vested_units_at(price)
    end
  end

  def grant_for(date)
    @grants.find { |grant| grant.issued_at == date }
  end
end
