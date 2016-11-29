module SalesTax
  module Rules
    NEAREST = (1 / 0.05)
    ROUNDING = lambda { |price| ((price * NEAREST).ceil / NEAREST) }
    ROUNDINGS = lambda { |price| (((price / NEAREST).ceil) * NEAREST) }
  end
end
