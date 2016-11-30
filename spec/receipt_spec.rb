require 'spec_helper'
require 'receipt'
require 'order'

describe Receipt do
  describe '.generate_csv' do
    let(:product) { build(:product, price: 10.0, name: "tonic for headache", sales_tax: 2.0, taxed_price: 3.0) }
    let(:imported_other) { build(:other, imported: true, price: 12.0, sales_tax: 2.0, taxed_price: 3.0) }
    before do
      @path = '21.out'
      @fullpath = 'outputs/21.out'
      @order = Order.new
      @receipt = Receipt.new(@order, @path)
    end

    it 'creates a csv file and writes the output into it' do
      expect(@order).to receive(:items) { [{quantity: 3, product: product},
                                           {quantity: 4, product: imported_other} ] }
      expect(@order).to receive(:sales_taxes) { 9.0 }
      expect(@order).to receive(:total) { 90.00 }
      @receipt.generate_csv
      expect { File.open(@fullpath) }.
        to_not raise_error
      file = File.open(@fullpath).read
      expect(file).to include("Sales Taxes: 9.00")
      expect(file).to include("Total: 90.00")
      File.delete(@fullpath) if File.exist?(@fullpath)
    end
  end
end
