class Product
  attr_reader :price, :stock
  attr_writer :price, :stock

  def initialize(product_attributes)
    @price = product_attributes[:price]
    @stock = product_attributes[:stock]
  end

  def to_s
    #abstract parent method
  end

  def update(updated_attributes)
    @price = updated_attributes[:price] if updated_attributes[:price]
    @stock = updated_attributes[:stock] if updated_attributes[:stock]
  end
end
