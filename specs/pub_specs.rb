require("minitest/autorun")
require("minitest/rg")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")
require_relative("../food.rb")

class TestPub < Minitest::Test

  def setup
    @drink1 = Drink.new("Beer", 3, 1)
    @drink2 = Drink.new("Wine", 5, 2)
    @drink3 = Drink.new("Vodka", 7, 3)
    @food1 = Food.new("Burger", 10, 5)
    @food2 = Food.new("Chips", 3, 2)
    @pub = Pub.new("Kings Arms", 100, [@drink1, @drink2, @drink3], [@food1, @food2])

    @customer1 = Customer.new("Dave", 40, 18)
    @customer2 = Customer.new("Brian", 20, 16)

  end

  def test_get_drink_name()
    assert_equal("Beer", @drink1.drink_name)
  end

  def test_buy_drink__over_age()
    @pub.sell_drink(@drink3, @customer1)
    assert_equal(107, @pub.till)
    assert_equal(33, @customer1.customer_wallet)
  end

  def test_buy_drink__under_age()
    @pub.sell_drink(@drink3, @customer2)
    assert_equal(100, @pub.till)
    assert_equal(40, @customer1.customer_wallet)
  end

  def test_buy_drink__drunkness()
    @pub.sell_drink(@drink3, @customer1)
    assert_equal(3, @customer1.drunkness)
  end

  def test_refuse_service()
    @pub.sell_drink(@drink3, @customer1)
    @pub.sell_drink(@drink3, @customer1)
    @pub.sell_drink(@drink3, @customer1)
    @pub.sell_drink(@drink3, @customer1)
    assert_equal(19, @customer1.customer_wallet)
    assert_equal(121, @pub.till)
  end

  def test_buy_food__money_transfer()
    @pub.sell_food(@food1, @customer2)
    assert_equal(10, @customer2.customer_wallet)
    assert_equal(110, @pub.till)
  end

  def test_reduce_drunkness()
    @pub.sell_drink(@drink3, @customer1)
    @pub.sell_drink(@drink3, @customer1)
    @pub.sell_food(@food1, @customer1)
    assert_equal(1, @customer1.drunkness)
  end
end
