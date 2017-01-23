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
    fail NotEnoughFundsError, 'You do not have enough funds in your account' if not_enough_funds?(amount)
    self.balance -= amount
  end

  private

  def empty?
    balance == 0
  end

  def not_enough_funds?(amount)
    amount > balance
  end

end

class AccountEmptyError < StandardError; end
class NotEnoughFundsError < StandardError; end
