require_relative './lib/order'
require_relative './lib/product'
require_relative './lib/product_parser'
require_relative './lib/sales_tax/context'
require_relative './lib/receipt'

# This is the main class to execute the entire program
# with inputs contained in the inputs folder
# and output goes into the outputs folder
class Main
  class << self
    def execute
      files = Dir.glob('inputs/*')
      process_files(files)
    end

    def process_files(files)
      files.each do |file|
        process_products(file)
      end
    end

    def process_products(file)
      order = Order.new
      File.open(file).each_with_index do |line, index|
        next if index.zero?
        params = product_params(line.chomp)
        product = Product.new(params)
        parsed_product = ProductParser.perform(product)
        taxed_product = SalesTax::Context.apply_tax(parsed_product)
        order.add(taxed_product, params[:quantity])
      end
      generate(order, get_file_name(file))
    end

    def product_params(line)
      array = line.split(',')
      { quantity: array[0].to_i, name: array[1].strip, price: array[2].to_f }
    end

    def get_file_name(file)
      file.split('/')[1].split('.')[0]
    end

    def generate(order, filename)
      receipt = Receipt.new(order, filename + '.csv')
      receipt.generate_csv
    end
  end
end

Main.execute
system('cat outputs/*')
