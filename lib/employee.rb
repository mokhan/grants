class Employee
  def initialize
    @grants = []
  end

  def issue_grant(value_of_grant, share_price)
    @grants.push(Grant.new(value_of_grant, share_price))
  end

  def value_of(type_of_units, price)
    @grants.inject(0.00.dollars) do |memo, grant|
      memo + type_of_units.from(grant, price)
    end
  end

  def grant_for(date)
    @grants.find { |grant| grant.issued_at == date }
  end
end
