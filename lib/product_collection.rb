class ProductCollection
  PRODUCT_TYPES = [
    {dir: 'films', class: Film},
    {dir: 'books', class: Book},
    {dir: 'discs', class: Disc}
  ]

  attr_reader :products

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[File.join(dir_path,product_dir,'*.txt')].sort.each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  def initialize(products = [])
    @products = products
  end

  def show_list
    @products.each_with_index.map { |product, index| "#{index+1}. #{product}" if product.stock > 0 }
  end

  def sort!(by: name, order: asc)
    case by
    when :name
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price }
    when :stock
      @products.sort_by! { |product| product.stock }
    end

    @products.reverse! if order == :desc

    self
  end
end
