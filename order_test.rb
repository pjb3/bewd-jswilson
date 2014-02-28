require 'minitest/autorun'
require './order'

class OrderTest < MiniTest::Unit::TestCase
  def test_total_price
    Product.add(name: "Muffin", price: 2.99)
    Product.add(name: "Coffee", price: 3.75)
    Product.add(name: "Smoothie", price: 3.99)

    order = Order.new(tax_rate: 0.05)

    order.add 2, "Muffin"
    order.add 1, "Coffee"
    order.add 1, "Smoothie"

    assert_equal 14.41, order.total_price
  end
end

class PrivateTest < MiniTest::Unit::TestCase
  def test_add_product_length
    #Product.add(name: "Muffin", price: 2.99)
    #Product.add(name: "Coffee", price: 3.75)
    #assert_equal Product.products.size, 2
    end

  def test_find_product
    #Product.add(name: "Muffin", price: 2.99)
    #Product.add(name: "Coffee", price: 3.75)

    #assert_equal Product.get("Muffin").name, "Muffin"
    #assert_equal Product.get("Coffee").name, "Coffee"
    end

    def test_find_bad_product
      assert_equal Product.get("Bad"), nil
    end

    def test_add_bad_product_to_order
      order = Order.new(tax_rate: 0.05)
      assert_raises(RuntimeError){order.add 2, "BadName"}
    end

end
