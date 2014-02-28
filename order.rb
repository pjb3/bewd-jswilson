class Product
  attr_accessor :name, :price

  def initialize(attrs={})
    attrs.each { |attr, value| send("#{attr}=", value) }
  end

  def self.add(attrs={})
    @products ||= []
    @products << Product.new(attrs)
  end

  def self.get(name)
    if @products.empty?
      nil
    end
    @products.find{|e| e.name == name}
  end
end


class LineItem
  attr_accessor :quantity, :product

  def initialize(quantity, product)
    @quantity = quantity
    @product = product
  end

  def line_item_price
    @quantity * @product.price
  end
end


class Order
	def initialize(tax_rate: 0.05)
		@tax_rate = tax_rate
		@line_items = []
	end

	def add(quantity, product_name)
    product = Product.get(product_name)
    if product == nil
      raise "No Such Product"
    end
    @line_items << LineItem.new(quantity, product)
	end

	def total_price
		subtotal = @line_items.reduce(0){|sum, e| sum + e.line_item_price }
		subtotal *= (1+@tax_rate)
		subtotal.round(2)
	end
end
