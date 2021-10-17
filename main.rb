require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

files_paths = Dir["#{__dir__}/data/films/*"].sort

puts files_paths.to_s

films =
  files_paths.map do |file_path|
    film = Film.from_file(file_path)
  end

files_paths = Dir["#{__dir__}/data/books/*"].sort

books =
  files_paths.map do |file_path|
    book = Book.from_file(file_path)
  end

puts "Films list:"
films.each { |film| puts film.to_s}

puts "-------"

puts "Books list:"
books.each { |book| puts book.to_s}
