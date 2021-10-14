class Film < Product
  attr_reader :name, :year, :director
  attr_writer :name, :year, :director

  def initialize(product_attributes)
    super

    @name = product_attributes[:name]
    @year = product_attributes[:year]
    @director = product_attributes[:director]
  end

  def to_s
    "Film #{@name} (#{@year}), director - #{@director}, cost = #{@price} USD (#{@stock} left)."
  end

  def update(updated_attributes)
    super

    @name = updated_attributes[:name] if updated_attributes[:name]
    @year = updated_attributes[:year] if updated_attributes[:year]
    @director = updated_attributes[:director] if updated_attributes[:director]
  end
end
