require_relative 'error'

class Product

  attr_accessor :name, :price, :type, :imported, :sales_tax, :taxed_price

  def initialize opts
    opts[:type] ||= :other
    opts[:imported] ||= false
    opts[:sales_tax] ||= 0.0
    opts[:taxed_price] ||= 0.0

    opts.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.nil?
    end

    validate_product!
  end

  def validate_product!
    unless @name.is_a?(String) && @price.is_a?(Float) &&
        @type.is_a?(Symbol) && !!@imported == @imported &&
        @sales_tax.is_a?(Float) && @taxed_price.is_a?(Float)
      raise InvalidProduct, "Some attributes of this product are invalid"
    else
      true
    end
  end
  alias valid? validate_product!
end
