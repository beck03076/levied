# opening the numberic standard class to add another method
class Numeric
  def percent_of(n)
    (n.to_f * (to_f / 100.0))
  end
end
