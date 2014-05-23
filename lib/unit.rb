class Unit
  def initialize
    @vested = false
  end

  def *(price)
    price
  end

  def vest_at(price)
    @vested = true
    @vesting_price = price
  end

  def vested?
    @vested
  end
end

class UnvestedUnits
  def from(grant, at_price)
    grant.value_of_unvested_units_at(at_price)
  end
end

class VestedUnits
  def from(grant, at_price)
    grant.value_of_vested_units_at(at_price)
  end
end
