class Product
  attr_reader :price, :stock

  def initialize(product_attributes)
    @price = product_attributes[:price]
    @stock = product_attributes[:stock]
  end

  def to_s
    #abstract parent method
  end
end
