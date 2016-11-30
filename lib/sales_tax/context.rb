require_relative 'calculator'
# This module encapsulates all the logic that
# goes into calculating the sales tax
module SalesTax
  # this the context class that separates the concern
  # of calculating the sales tax
  #
  # Implementing the Strategy Design Pattern
  # @see https://en.wikipedia.org/wiki/Strategy_pattern
  class Context
    # initializes a context with a product if passed
    # else initializes with a NoProduct
    def initialize(product = NoProduct.new)
      @product = product
    end

    # Class method to perform the tax calculation and
    # set the value of sales_tax and taxed_price for a product
    #
    # @param parsed_product [Product]
    # @return [Product]
    def self.apply_tax(parsed_product)
      taxes = new(parsed_product).calculate
      parsed_product.sales_tax = taxes[:sales_tax]
      parsed_product.taxed_price = taxes[:taxed_price]
      parsed_product
    end

    # calculates the sales tax
    def calculate
      calculator.calculate do |tax, taxed_price|
        { sales_tax: tax, taxed_price: taxed_price }
      end
    end

    private

    def calculator
      @calculator ||= SalesTax::Calculator.new(@product.price,
                                               @product.type,
                                               @product.imported)
    end
  end
end
