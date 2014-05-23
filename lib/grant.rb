class Grant
  include Enumerable
  attr_reader :issued_at

  def initialize(value_of_grant, share_price, date = Clock.today)
    number_of_units = value_of_grant / share_price
    @units = Array.new(number_of_units) { Unit.new }
    @issued_at = date
  end

  def vest_at(price, portion)
    number_of_units_to_vest = portion.to_f * @units.count
    unvested_units.take(number_of_units_to_vest).each do |unit|
      unit.vest_at(price)
    end
  end

  def each
    @units.each { |unit| yield unit }
  end

  def value_of(units, price)
    units.inject(0.00.dollars) do |memo, unit|
      memo + (unit * price)
    end
  end

  private

  def unvested_units
    @units - vested_units
  end

  def vested_units
    @units.find_all { |x| x.vested? }
  end
end
