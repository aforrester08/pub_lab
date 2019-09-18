class Customer

  attr_accessor :customer_name, :customer_wallet, :drunkness
  attr_reader :age

  def initialize(customer_name, customer_wallet, age)
    @customer_name = customer_name
    @customer_wallet = customer_wallet
    @age = age
    @drunkness = 0
  end

end
