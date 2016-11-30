require 'product'

FactoryGirl.define do
  factory :product, class: Product do
    name ''
    price 0.0
    type :other
    imported false
    sales_tax 0.0
    taxed_price 0.0

    initialize_with { new(name: name, price: price, type: type, imported: imported, sales_tax: sales_tax, taxed_price: taxed_price) }
  end
end

FactoryGirl.define do
  factory :food, class: Product do
    name 'box of chocolates'
    price 11.25
    type :food
    imported false
    sales_tax 0.0
    taxed_price 0.0

    initialize_with { new(name: name, price: price, type: type, imported: imported, sales_tax: sales_tax, taxed_price: taxed_price) }
  end
end

FactoryGirl.define do
  factory :book, class: Product do
    name 'book'
    price 9.99
    type :book
    imported false
    sales_tax 0.0
    taxed_price 0.0

    initialize_with { new(name: name, price: price, type: type, imported: imported, sales_tax: sales_tax, taxed_price: taxed_price) }
  end
end

FactoryGirl.define do
  factory :medical, class: Product do
    name 'headache pills'
    price 9.99
    type :medical
    imported false
    sales_tax 0.0
    taxed_price 0.0

    initialize_with { new(name: name, price: price, type: type, imported: imported, sales_tax: sales_tax, taxed_price: taxed_price) }
  end
end

FactoryGirl.define do
  factory :other, class: Product do
    name 'a generic product in the world'
    price 27.99
    type :other
    imported false
    sales_tax 0.0
    taxed_price 0.0

    initialize_with { new(name: name, price: price, type: type, imported: imported, sales_tax: sales_tax, taxed_price: taxed_price) }
  end
end
