require_relative 'calculator'

module SalesTax
  class Context

    def initialize(product = NoProduct.new)
      @product = product
    end

    def self.apply_tax(parsed_product)
      taxes = new(parsed_product).calculate
      parsed_product.sales_tax = taxes[:sales_tax]
      parsed_product.taxed_price = taxes[:taxed_price]
      parsed_product
    end


    def calculate
      calculator.calculate do |tax, taxed_price|
        {sales_tax: tax, taxed_price: taxed_price}
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

