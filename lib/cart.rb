require_relative 'product'

class Cart
  attr_reader :products, :total_sum

  def initialize
    @products = []
    @total_sum = 0
  end

  def add_product(product)
    if product.stock_left?
      @products << product
      @total_sum += product.price
      product.stock -= 1

      <<~ADDED
        Вы выбрали: #{product.short_info}
        В вашей корзине #{@products.size} товар(а).
        -------
      ADDED
    else
      <<~NOT_FOUND
        Данного товара больше нет на складе.
        -------

      NOT_FOUND
    end
  end

  def empty?
    @products == 0
  end

  def checkout
    cart = Hash.new(0)

    @products.each do |v|
      cart[v] += 1
    end

    a = cart.map do |k,v|
      "- #{k.short_info} (x#{v}) = #{v * k.price} USD"
    end
  end
end
