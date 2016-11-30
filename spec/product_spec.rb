require 'spec_helper'
require 'product'

describe Product do
  describe '.new' do
    let(:product1) { build(:product, name: "ok", price: 1.0, type: :other, imported: false) }

    it 'creates a product object in the right format' do
      expect(product1.name).to eq('ok')
      expect(product1.type).to eq(:other)
      expect(product1.imported).to be_falsy
      expect(product1.price).to eq(1.0)
      expect(product1.sales_tax).to eq(0.0)
    end

    it 'creating an invalid product raises exception' do
      expect{ Product.new({name: true, price: true, type: true, imported: true}) }.
        to raise_exception InvalidProduct
    end

  end
end
