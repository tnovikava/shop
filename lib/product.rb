class Product
  attr_reader :price, :stock

  def initialize(price, stock)
    @price = price
    @stock = stock
  end
end
