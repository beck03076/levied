require_relative 'error'
# Class to create a valid product with all the right attributes
class Product
  attr_accessor :name, :price, :type, :imported, :sales_tax, :taxed_price

  # Initializes a product
  #
  # @param opts [Hash]
  # @return [Product]
  def initialize(opts)
    opts[:type] ||= :other
    opts[:imported] ||= false
    opts[:sales_tax] ||= 0.0
    opts[:taxed_price] ||= 0.0

    opts.each do |key, value|
      instance_variable_set("@#{key}", value) unless value.nil?
    end

    validate_product!
  end

  # validates a product
  #
  # @raise [InvalidProduct] raises an exception is attributes
  # are of wrong type
  def validate_product!
    if @name.is_a?(String) && @price.is_a?(Float) &&
        @type.is_a?(Symbol) && !!@imported == @imported &&
        @sales_tax.is_a?(Float) && @taxed_price.is_a?(Float)
      true
    else
      raise InvalidProduct, 'Some attributes of this product are invalid'
    end
  end
  alias valid? validate_product!
end
