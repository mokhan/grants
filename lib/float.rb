class Float
  def dollars
    Money.new(self)
  end
end

