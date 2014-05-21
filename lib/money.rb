class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def +(other_money)
    Money.new(amount + other_money.amount)
  end

  def ==(other_money)
    amount == other_money.amount
  end

  def eql?(other_money)
    self == other_money
  end
end
