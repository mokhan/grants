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
