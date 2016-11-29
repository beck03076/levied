class Main

  def self.execute
    files = Reader.new("inputs")
    process_files(files)
  end

  def process_files(files)
    files.each do |file|
      process_products(file)
    end
  end

  def process_products(file)
    order = Order.new
    file.each do |line|
      product = Product.new(line)
      populated_product = ProductSetter.perform(product)
      taxed_product = SalesTax::Context.apply_tax(populated_product)
      @order.add(taxed_product)
    end
    generate(order)
  end

  def generate(order)
    receipt = Receipt.new(order)
    receipt.generate_csv
  end
end
