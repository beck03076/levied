module SalesTax
  # All rules to calculate the sales tax goes into this module
  # ROUNDING rule is included
  module Rules
    NEAREST = (1 / 0.05)
    ROUNDING = ->(price) { ((price * NEAREST).ceil / NEAREST) }
  end
end
