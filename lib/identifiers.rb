# This is mostly used by the ProductParser class
# you can add keywords here to make a product to be
# identified as what type and what text determines a product
# to an imported product
module Identifiers
  BOOK = %w(book books).freeze
  FOOD = %w(chocolate chocolates).freeze
  MEDICAL = %w(pills tonic).freeze
  OTHER = [].freeze

  ALL = { book: BOOK, food: FOOD, medical: MEDICAL, other: OTHER }.freeze

  IMPORTED = 'imported'.freeze
end
