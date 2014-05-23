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
    unvested_units = grant.find_all { |unit| unit.vested? == false }
    grant.value_of(unvested_units, at_price)
  end
end

class VestedUnits
  def from(grant, at_price)
    vested_units = grant.find_all { |unit| unit.vested? }
    grant.value_of(vested_units, at_price)
  end
end
