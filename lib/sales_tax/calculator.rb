require_relative 'values'
require_relative 'rules'
require_relative '../core_ext/numeric'

module SalesTax
  class Calculator

    include SalesTax::Values
    include SalesTax::Rules

    attr_reader :price, :type, :imported

    def initialize(price, type, imported)
      @price = price
      @type = type
      @imported = imported
    end

    def calculate(&block)
      taxed_price = (price + tax_amount).round(2)
      block.call(tax_amount, taxed_price)
    end

    def tax_amount
      rounded(tax.percent_of(price))
    end

    private

    def tax
      tax_array = []
      tax_array << SalesTax::Values.const_get(type.to_s.upcase)
      tax_array << SalesTax::Values::IMPORTED if imported
      tax_array.inject(0, :+)
    end

    def rounded(tax_amt)
      (SalesTax::Rules::ROUNDING.call tax_amt)
    end
  end
end

