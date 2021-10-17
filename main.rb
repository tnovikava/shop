require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/product_collection'

files_paths = Dir["#{__dir__}/data/films/*"].sort

films =
  files_paths.map do |file_path|
    film = Film.from_file(file_path)
  end

files_paths = Dir["#{__dir__}/data/books/*"].sort

books =
  files_paths.map do |file_path|
    book = Book.from_file(file_path)
  end

all_products = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

all_products.sort!(by: :price, order: :asc)

all_products.to_a.each do |product|
  puts product
end
