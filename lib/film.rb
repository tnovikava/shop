class Film < Product
  attr_reader :name, :year, :director

  def initialize(product_attributes)
    super

    @name = product_attributes[:name]
    @year = product_attributes[:year]
    @director = product_attributes[:director]
  end

  def to_s
    "Film #{@name} (#{@year}), director - #{@director}, cost = #{@price} USD (#{@stock} left)."
  end
end
