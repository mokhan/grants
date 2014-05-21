class Float
  def dollars
    Money.new(self)
  end

  def dollar
    self.dollars
  end
end


class Fixnum
  def dollar
    self.dollars
  end

  def dollars
    self.to_f.dollars
  end
end
