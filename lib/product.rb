class Product

  attr_accessor :name, :price, :type, :imported

  def initialize(name, price, type = :normal, imported = true)
    @name = name
    @price = price
    @type = type
    @imported = imported
  end



end
