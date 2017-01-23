require_relative './transaction_log'
require_relative './statement'

class Account

  attr_accessor :balance


  def initialize(transaction_log: TransactionLog.new, statement_class: Statement)
    @balance = 0
    @transaction_log = transaction_log
    @statement_class = statement_class
  end

  def deposit(amount)
    self.balance += amount
    transaction_log.add_transaction(amount, balance)
  end

  def withdraw(amount)
    fail AmountError, 'Please enter an amount greater than zero' if amount == 0
    fail AccountEmptyError, 'Account is empty' if empty?
    fail NotEnoughFundsError, 'You do not have enough funds in your account' if not_enough_funds?(amount)
    self.balance -= amount
    transaction_log.add_transaction(-amount, balance)
  end

  def print_statement
    statement_class.new(transaction_log)
  end

  private

  attr_reader :transaction_log, :statement_class

  def empty?
    balance == 0
  end

  def not_enough_funds?(amount)
    amount > balance
  end

end

class AccountEmptyError < StandardError; end
class NotEnoughFundsError < StandardError; end
class AmountError < StandardError; end
