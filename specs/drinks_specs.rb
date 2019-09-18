require("minitest/autorun")
require("minitest/rg")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")

class TestDrink < Minitest::Test

  def test_get_drink()
    drink = Drink.new("Beer", 3)
    assert_equal("Beer", drink.drink_name)
  end

end
