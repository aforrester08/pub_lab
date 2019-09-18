require("minitest/autorun")
require("minitest/rg")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")

class TestPub < Minitest::Test

  def setup
    @drink1 = Drink.new("Beer", 3)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Vodka", 7)
    @pub = Pub.new("Kings Arms", 100, [@drink1, @drink2, @drink3])

    @customer1 = Customer.new("Dave", 20)
  end

  def test_get_drink_name()
    assert_equal("Beer", @drink1.drink_name)
  end

  def test_buy_drink()
    @pub.sell_drink(@drink3, @customer1)
    assert_equal(107, @pub.till)
    assert_equal(13, @customer1.customer_wallet)
  end

end
