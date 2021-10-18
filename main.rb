require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disc'
require_relative 'lib/product_collection'
require_relative 'lib/cart'

all_products = ProductCollection.from_dir("#{__dir__}/data")
cart = Cart.new

puts all_products.show_list
puts "0. Exit"
puts "Выберите товар:"
user_choice = STDIN.gets.to_i

until user_choice == 0
  until (1..all_products.products.size).include?(user_choice)
    puts "Такой товар не найден, попробуйте снова:"
    user_choice = STDIN.gets.to_i
  end

  puts cart.add_product(all_products.products[user_choice - 1])

  puts all_products.show_list
  puts "0. Exit"
  puts "Выберите товар:"
  user_choice = STDIN.gets.to_i
end

if cart.empty?
  puts "Ваша корзина пуста."
else
  puts "Продукты к корзине:"
  puts cart.checkout
  puts "Итоговая сумма: #{cart.total_sum} USD."
end
