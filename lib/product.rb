class Product
  attr_reader :price, :stock
  attr_writer :price, :stock

  def initialize(product_attributes)
    @price = product_attributes[:price].to_i
    @stock = product_attributes[:stock].to_i
  end

  def to_s
    #abstract parent method
  end

  def update(updated_attributes)
    @price = updated_attributes[:price] if updated_attributes[:price]
    @stock = updated_attributes[:stock] if updated_attributes[:stock]
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end

  def stock_left?
    @stock > 0
  end
end
