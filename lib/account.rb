class Account

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    fail AccountEmptyError, 'Account is empty' if empty?
    self.balance -= amount
  end

  private

  def empty?
    balance == 0
  end

end

class AccountEmptyError < StandardError; end
