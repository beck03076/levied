require 'spec_helper'
require 'product_parser'

describe ProductParser do

  let(:food) { build(:food, price: 0.85, type: :nothing, imported: false) }
  let(:imported_food) { build(:food, name: "imported chocolate packets", type: :nothing, imported: false) }

  let(:book) { build(:product, name: "book of titans") }
  let(:imported_book) { build(:product, name: "book of titans, imported from australia") }

  let(:medical) { build(:product, name: "throat infection pills") }
  let(:imported_medical) { build(:product, name: "imported headache pills") }

  let(:other) { build(:product, name: "total non sense as a product") }
  let(:imported_other) { build(:product, name: "imported nonsense as a product") }

  describe '.perform' do
    context 'sets type and imported' do
      it 'food and not imported' do
        product = ProductParser.perform(food)
        expect(product.type).to eq(:food)
        expect(product.imported).to eq(false)
      end
      it 'food and imported' do
        product = ProductParser.perform(imported_food)
        expect(product.type).to eq(:food)
        expect(product.imported).to eq(true)
      end
      it 'book and not imported' do
        product = ProductParser.perform(book)
        expect(product.type).to eq(:book)
        expect(product.imported).to eq(false)
      end
      it 'book and imported' do
        product = ProductParser.perform(imported_book)
        expect(product.type).to eq(:book)
        expect(product.imported).to eq(true)
      end
      it 'medical and not imported' do
        product = ProductParser.perform(medical)
        expect(product.type).to eq(:medical)
        expect(product.imported).to eq(false)
      end
      it 'medical and imported' do
        product = ProductParser.perform(imported_medical)
        expect(product.type).to eq(:medical)
        expect(product.imported).to eq(true)
      end
      it 'other and not imported' do
        product = ProductParser.perform(other)
        expect(product.type).to eq(:other)
        expect(product.imported).to eq(false)
      end
      it 'other and imported' do
        product = ProductParser.perform(imported_other)
        expect(product.type).to eq(:other)
        expect(product.imported).to eq(true)
      end
    end
  end
end

