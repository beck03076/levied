require_relative 'identifiers'

class ProductParser

  attr_accessor :product

  def self.perform(raw_product)
    parser = new(raw_product)
    parser.set_attrs
    parser.product
  end

  def initialize(product)
    @product = product
  end

  def set_attrs
    set_type
    set_imported
  end

  private

  def set_imported
    @product.imported = product.name.scan(::Identifiers::IMPORTED).any?
  end

  def set_type
    set_identified_text
    ::Identifiers::ALL.each do |key, value|
      if value.include?(@identified_text.first)
        @product.type = key
        break
      end
    end
    @product.type ||= :other
  end

  def set_identified_text
    ::Identifiers::ALL.values.flatten.each do |text|
      @identified_text = product.name.scan(text)
      break unless @identified_text.empty?
    end
  end
end
