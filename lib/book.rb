class Book < Product
  attr_reader :name, :genre, :author
  attr_writer :name, :genre, :author

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true, encoding: 'UTF-8')
    self.new(name: lines[0], author: lines[1], genre: lines[2], price: lines[3].to_i, stock: lines[4].to_i)
  end

  def initialize(product_attributes)
    super

    @name = product_attributes.fetch(:name)
    @genre = product_attributes.fetch(:genre)
    @author = product_attributes.fetch(:author)
  end

  def to_s
    "Book #{@name}, genre #{@genre}, author - #{@author}, cost = #{@price} USD (#{@stock} left)."
  end

  def short_info
    "Book #{@name}, author - #{@author}."
  end

  def update(updated_attributes)
    super

    @name = updated_attributes[:name] if updated_attributes[:name]
    @genre = updated_attributes[:genre] if updated_attributes[:genre]
    @author = updated_attributes[:author] if updated_attributes[:author]
  end
end
