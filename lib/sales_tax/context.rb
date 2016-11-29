require_relative 'calculator'

module SalesTax
  class Context

    def initialize(product = NoProduct.new)
      @product = product
    end

    def calculate
      calculator.calculate
    end

    private

    def calculator
      @calculator ||= SalesTax::Calculator.new(@product.price,
                                             @product.type,
                                             @product.imported)

    end
  end
end

