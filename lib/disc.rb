class Disc < Product
  attr_reader :album_name, :author, :genre, :year
  attr_writer :album_name, :author, :genre, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true, encoding: 'UTF-8')
    self.new(album_name: lines[0], author: lines[1], genre: lines[2], year: lines[3].to_i, price: lines[4].to_i, stock: lines[5].to_i)
  end

  def initialize(product_attributes)
    super

    @album_name = product_attributes.fetch(:album_name)
    @author = product_attributes.fetch(:author)
    @genre = product_attributes.fetch(:genre)
    @year = product_attributes.fetch(:year)
  end

  def to_s
    "Album #{@album_name} (#{@year}), genre #{@genre}, author - #{@author}, cost = #{@price} USD (#{@stock} left)."
  end

  def short_info
    "Album #{@album_name} (#{@year}), author - #{@author}."
  end

  def update(updated_attributes)
    super

    @name = updated_attributes[:album_name] if updated_attributes[:album_name]
    @genre = updated_attributes[:genre] if updated_attributes[:genre]
    @author = updated_attributes[:author] if updated_attributes[:author]
    @year = updated_attributes[:year] if updated_attributes[:year]
  end
end
