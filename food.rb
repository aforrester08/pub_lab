class Food

  attr_reader :food_name, :food_price, :rejuvination_level

  def initialize(food_name, food_price, rejuvination_level)
    @food_name = food_name
    @food_price = food_price
    @rejuvination_level = rejuvination_level
  end

end
