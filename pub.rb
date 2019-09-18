class Pub

  attr_accessor :pub_name, :till

  def initialize(pub_name, till, drinks)
    @pub_name = pub_name
    @till = till
    @drinks = drinks
    @order = []
  end

  def sell_drink(drink, customer)
    @till += drink.drink_price
    customer.customer_wallet -= drink.drink_price
  end

end
