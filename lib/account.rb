class Account

  attr_accessor :balance


  def initialize(transaction_log: TransactionLog.new)
    @balance = 0
    @transaction_log = transaction_log
  end

  def deposit(amount)
    self.balance += amount
    transaction_log.add_transaction(amount)
  end

  def withdraw(amount)
    fail AccountEmptyError, 'Account is empty' if empty?
    fail NotEnoughFundsError, 'You do not have enough funds in your account' if not_enough_funds?(amount)
    self.balance -= amount
  end

  private

  attr_reader :transaction_log

  def empty?
    balance == 0
  end

  def not_enough_funds?(amount)
    amount > balance
  end

end

class AccountEmptyError < StandardError; end
class NotEnoughFundsError < StandardError; end
