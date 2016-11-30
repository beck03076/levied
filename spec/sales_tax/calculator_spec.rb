require 'spec_helper'
require 'sales_tax/calculator'

describe SalesTax::Calculator do

  before do
    @calculator = SalesTax::Calculator.new(9.0,:book, true)
  end

  describe '.new' do
    it 'initializes a calculator successfully' do
      expect(@calculator).to be_kind_of(SalesTax::Calculator)
      expect(@calculator.price).to eq(9.0)
      expect(@calculator.type).to eq(:book)
      expect(@calculator.imported).to be_truthy
    end
  end

  describe '.calculate' do
    it 'calls a block with tax and price' do
      @calculator.calculate do |tax, price|
        expect(tax).to eq(0.45)
        expect(price).to eq(9.45)
      end
    end
  end

  describe '.calculate' do
    it 'calls a block with tax and price' do
      expect(@calculator.tax_amount).to eq(0.45)
    end
  end
end

