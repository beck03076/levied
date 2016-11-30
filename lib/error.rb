# A general Github exception
class Error < StandardError; end
# Raised when product is invalid
class InvalidProduct < Error; end
# Raised when order item is invalid
class InvalidOrderItem < Error; end

