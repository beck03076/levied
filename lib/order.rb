require_relative 'error'
# order to contain all the products, calculate total tax and
# total price
class Order
  attr_accessor :items
  INVALID_ORDER = 'You are trying to add invalid item to an order'.freeze

  # initialize an empty items array
  def initialize
    @items = []
  end

  # method to add products into an order with qunatity
  #
  # @param product [Product]
  # @param quantity [Fixnum]
  def add(product, quantity)
    validate_item!(product, quantity)
    @items << { quantity: quantity, product: product } if product.valid?
  end

  # compute the sales tax based on quantity
  # @return [Float]
  def sales_taxes
    compute_sum('sales_tax')
  end

  # compute the total price based on quantity
  # @return [Float]
  def total
    compute_sum('taxed_price')
  end

  private

  def compute_sum(attr)
    value = 0
    @items.each do |item|
      value += item[:quantity] * item[:product].send(attr)
    end
    value
  end

  def validate_item!(product, quantity)
    condition = product.is_a?(Product) && quantity.is_a?(Integer)
    raise InvalidOrderItem, INVALID_ORDER unless condition
  end
end
