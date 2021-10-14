class Book < Product
  attr_reader :name, :genre, :author
  attr_writer :name, :genre, :author

  def initialize(product_attributes)
    super

    @name = product_attributes[:name]
    @genre = product_attributes[:genre]
    @author = product_attributes[:author]
  end

  def to_s
    "Book #{@name}, genre #{@genre}, author - #{@author}, cost = #{@price} USD (#{@stock} left)."
  end

  def update(updated_attributes)
    super

    @name = updated_attributes[:name] if updated_attributes[:name]
    @genre = updated_attributes[:genre] if updated_attributes[:genre]
    @author = updated_attributes[:author] if updated_attributes[:author]
  end
end
