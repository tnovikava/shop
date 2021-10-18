class Film < Product
  attr_reader :name, :year, :director
  attr_writer :name, :year, :director

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true, encoding: 'UTF-8')
    self.new(name: lines[0], director: lines[1], year: lines[2].to_i, price: lines[3].to_i, stock: lines[4].to_i)
  end

  def initialize(product_attributes)
    super

    @name = product_attributes.fetch(:name)
    @year = product_attributes.fetch(:year)
    @director = product_attributes.fetch(:director)
  end

  def to_s
    "Film #{@name} (#{@year}), director - #{@director}, cost = #{@price} USD (#{@stock} left)."
  end

  def short_info
    "Film #{@name} (#{@year}), director - #{@director}."
  end

  def update(updated_attributes)
    super

    @name = updated_attributes[:name] if updated_attributes[:name]
    @year = updated_attributes[:year] if updated_attributes[:year]
    @director = updated_attributes[:director] if updated_attributes[:director]
  end
end
