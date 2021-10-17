require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disc'
require_relative 'lib/product_collection'

all_products = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

products_to_bought = []
total_sum = 0

puts all_products.show_list
puts "Выберите товар:"
user_choice = STDIN.gets.to_i

until user_choice == 0 do
  while user_choice < 0 || user_choice > all_products.products.size
    puts "Такой товар не найден, попробуйте снова:"
    user_choice = STDIN.gets.to_i
  end

  if all_products.products[user_choice-1].stock_left?
    products_to_bought << all_products.products[user_choice-1]
    total_sum += all_products.products[user_choice-1].price
    all_products.products[user_choice-1].stock -= 1
    puts "Вы выбрали: #{all_products.products[user_choice-1]}"
    puts "В вашей корзине #{products_to_bought.size} товар(а)."
    puts "-------"
    puts
  else
    puts "Данного товара больше нет на складе."
    puts "-------"
    puts
  end

  puts all_products.show_list
  puts "Выберите товар:"
  user_choice = STDIN.gets.to_i
end

if products_to_bought.empty?
  puts "Ваша корзина пуста."
else
  puts "Вы купили:"
  products_to_bought.each { |product| puts product.to_s}
  puts "Итоговая сумма: #{total_sum} USD. Спасибо за покупки!"
end


