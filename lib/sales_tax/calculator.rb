require_relative 'values'
require_relative 'rules'
require_relative '../core_ext/numeric'

module SalesTax
  # Separate concern to calculate the sales tax
  # here lies the strategy
  class Calculator
    include SalesTax::Values
    include SalesTax::Rules

    attr_reader :price, :type, :imported

    # Initializes a calculator object
    #
    # @param price [Float]
    # @param type [Symbol]
    # @param imported [Boolean]
    def initialize(price, type, imported)
      @price = price
      @type = type
      @imported = imported
    end

    # @return [Block]
    def calculate
      taxed_price = (price + tax_amount).round(2)
      yield(tax_amount, taxed_price)
    end

    # returns the rounded tax_amount
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
