require 'csv'
# Class to take an order and print the receipt
class Receipt
  # initialize a receipt
  #
  # @param order [Order]
  # @param path [String]
  def initialize(order, path)
    @order = order
    @path = path
  end

  # outputs a csv file to the ouputs directory
  def generate_csv
    CSV.open("outputs/#{@path}", 'w') do |csv|
      csv << ['###########']
      csv << ["# Output #{@path}"]
      csv << ['###########']
      @order.items.each do |item|
        csv << [item[:quantity], ' ' + item[:product].name, ' ' + item[:product].taxed_price.to_s]
      end
      csv << []
      csv << ["Sales Taxes: #{sprintf('%0.02f', @order.sales_taxes)}"]
      csv << ["Total: #{sprintf('%0.02f', @order.total)}"]
    end
  end
end
