class Account

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount
  end

end
