require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

products = []

products << Film.new(price: 10, stock: 30, name: "Leon", year: 1994,
  director: "Luc Besson")
products << Book.new(price: 23, stock: 5,
  name: "Harry Potter and the Sorcerer's Stone", genre: "Fantasy", author: "J. K. Rowling")

puts "Product list:"

products.each { |product| puts product.to_s}
