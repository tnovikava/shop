require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

leon_film = Film.new(1500,30)

puts "Фильм Леон стоит #{leon_film.price} руб."
