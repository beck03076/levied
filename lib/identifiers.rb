module Identifiers
  BOOK = %w(book books)
  FOOD = %w(chocolate chocolates)
  MEDICAL = %w(pills tonic)
  OTHER = []

  ALL = { book: BOOK, food: FOOD, medical: MEDICAL, other: OTHER }.freeze

  IMPORTED = "imported".freeze
end
