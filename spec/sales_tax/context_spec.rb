require 'spec_helper'
require 'sales_tax/context'

describe SalesTax::Context do
  let(:food) { build(:food, price: 0.85) }
  let(:book) { build(:book, price: 12.49) }
  let(:medical) { build(:medical, price: 9.75) }
  let(:other) { build(:other, price: 14.99) }

  describe '.new' do
    it 'initializes with a NoProduct without args' do
      expect { SalesTax::Context.new }.
        to_not raise_error
    end
  end

  describe '.apply_tax' do
    it 'sets the value of sales_tax and taxed_price' do
      product = SalesTax::Context.apply_tax(book)
      expect(product.sales_tax).to eq(0.0)
      expect(product.taxed_price).to eq(12.49)
    end
  end

  describe '.calculate no imported products' do
    it 'does not add any tax for book' do
      context = SalesTax::Context.new(book)
      expect(context.calculate[:taxed_price]).to eq(12.49)
    end

    it 'does not add any tax for food' do
      context = SalesTax::Context.new(food)
      expect(context.calculate[:taxed_price]).to eq(0.85)
    end

    it 'does not add any tax for medical' do
      context = SalesTax::Context.new(medical)
      expect(context.calculate[:taxed_price]).to eq(9.75)
    end

    it 'adds 10% tax for other products' do
      context = SalesTax::Context.new(other)
      expect(context.calculate[:taxed_price]).to eq(16.49)
    end
  end

  let(:imported_food) { build(:food, imported: true, price: 11.25) }
  let(:imported_book) { build(:book, imported: true, price: 12.49) }
  let(:imported_medical) { build(:medical, imported: true, price: 9.75) }
  let(:imported_other) { build(:other, imported: true, price: 27.99) }

  describe '.calculate imported products' do
    it 'does not add any tax for book' do
      context = SalesTax::Context.new(imported_book)
      expect(context.calculate[:taxed_price]).to eq(13.14)
    end

    it 'does not add any tax for food' do
      context = SalesTax::Context.new(imported_food)
      expect(context.calculate[:taxed_price]).to eq(11.85)
    end

    it 'does not add any tax for medical' do
      context = SalesTax::Context.new(imported_medical)
      expect(context.calculate[:taxed_price]).to eq(10.25)
    end

    it 'adds 10% tax for other products' do
      context = SalesTax::Context.new(imported_other)
      expect(context.calculate[:taxed_price]).to eq(32.19)
    end
  end
end
