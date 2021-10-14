require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

products = []

leon_film = Film.new(price: 10, stock: 30, name: "Leon", year: 1994,
  director: "Luc Besson")
products << leon_film

harry_potter_book = Book.new(price: 23, stock: 5,
  name: "Harry Potter and the Sorcerer's Stone", genre: "Fantasy", author: "J. K. Rowling")
products << harry_potter_book

puts "Product list:"
products.each { |product| puts product.to_s}

puts "-------"

harry_potter_book.update(price: 30_000)
leon_film.price = 20_000

puts leon_film.to_s
puts harry_potter_book.to_s
