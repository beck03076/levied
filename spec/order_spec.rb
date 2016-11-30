require 'spec_helper'
require 'order'

describe Order do
  let(:product1) { build(:product, name: 'ok', price: 1.0, type: :other, imported: false) }
  let(:product2) { build(:product, name: 'ok', price: 45.0, type: :other, imported: false, sales_tax: 7.0, taxed_price: 52.0) }
  before do
    @order = Order.new
  end

  describe '.new' do
    it 'creates an order with empty items' do
      expect(@order.items).to be_empty
    end

    it 'raises exception if added items are not products' do
      expect { @order.add(1, 'dummmy') }
        .to raise_exception InvalidOrderItem
    end

    it 'adds an item successfully' do
      @order.add(product1, 2)
      expect(@order.items.size).to eq(1)
      expect(@order.items.first[:quantity]).to eq(2)
      expect(@order.items.first[:product]).to be_kind_of(Product)
    end
  end

  describe '.sales_taxes' do
    it 'returns the sum of sales_taxes' do
      @order.add(product1, 4)
      @order.add(product2, 6)
      expect(@order.sales_taxes).to eq(42.0)
    end
  end

  describe '.total' do
    it 'returns the sum of sales_taxes' do
      @order.add(product1, 4)
      @order.add(product2, 6)
      expect(@order.total).to eq(312.0)
    end
  end
end
