class Book < Product
  attr_reader :name, :genre, :author

  def initialize(product_attributes)
    super

    @name = product_attributes[:name]
    @genre = product_attributes[:genre]
    @author = product_attributes[:author]
  end

  def to_s
    "Book #{@name}, genre #{@genre}, author - #{@author}, cost = #{@price} USD (#{@stock} left)."
  end
end
