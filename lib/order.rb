require_relative 'error'

class Order

  attr_accessor :items

  def initialize
    @items = []
  end

  def add(product, quantity)
    validate_item!(product, quantity)
    @items << { quantity: quantity, product: product } if product.valid?
  end

  def sales_taxes
    compute_sum('sales_tax')
  end

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
    unless product.is_a?(Product) && quantity.is_a?(Fixnum)
      raise InvalidOrderItem, "You are trying to add invalid item to an order"
    end
  end


end

