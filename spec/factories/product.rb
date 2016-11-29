require 'product'

FactoryGirl.define do
  factory :food, class: Product do
    name "box of chocolates"
    price 11.25
    type :food
    imported false

    initialize_with { new(name, price, type, imported) }
  end
end

FactoryGirl.define do
  factory :book, class: Product do
    name "book"
    price 9.99
    type :book
    imported false

    initialize_with { new(name, price, type, imported) }
  end
end

FactoryGirl.define do
  factory :medical, class: Product do
    name "headache pills"
    price 9.99
    type :medical
    imported false

    initialize_with { new(name, price, type, imported) }
  end
end

FactoryGirl.define do
  factory :other, class: Product do
    name "a generic product in the world"
    price 27.99
    type :other
    imported false

    initialize_with { new(name, price, type, imported) }
  end
end

