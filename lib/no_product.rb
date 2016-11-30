# This is a Null object class which helps for the attributes of
# the objects to this class to always respond with a default value
#
# Null Object Pattern
# @see https://en.wikipedia.org/wiki/Null_Object_pattern
class NoProduct
  NAME = 'this is a default name'.freeze
  PRICE = 0.0.freeze
  TYPE = :other
  IMPORTED = true
  SALES_TAX = 0.0

  # @return [String]
  def name
    NAME
  end

  # @return [Float]
  def price
    PRICE
  end

  # @return [Symbol]
  def type
    TYPE
  end

  # @return [Boolean]
  def imported
    false
  end

  # @return [Float]
  def sales_tax
    SALES_TAX
  end

end

