class Pub

  attr_accessor :pub_name, :till

  def initialize(pub_name, till, drinks, food)
    @pub_name = pub_name
    @till = till
    @drinks = drinks
    @food = food
    @order = []
  end

  def sell_drink(drink, customer)
    if customer.age >= 18 && customer.drunkness < 9
      @till += drink.drink_price
      customer.customer_wallet -= drink.drink_price
      customer.drunkness += drink.alcohol_level
    end
    return
  end

  def sell_food(food, customer)
    @till += food.food_price
    customer.customer_wallet -= food.food_price
    customer.drunkness -= food.rejuvination_level
  end

end
