require 'spec_helper'
require 'no_product'

describe NoProduct do
  describe '.new' do
    it 'assigns default valuse' do
      product = NoProduct.new
      expect(product.name).to eq('this is a default name')
      expect(product.price).to eq(0.0)
      expect(product.sales_tax).to eq(0.0)
      expect(product.type).to eq(:other)
      expect(product.imported).to be_falsy
    end
  end
end
