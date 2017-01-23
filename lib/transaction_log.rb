require_relative './transaction'

class TransactionLog

  attr_reader :transactions

  def initialize(transaction_class: Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def add_transaction(amount, resulting_balance)
    transactions.push(transaction_class.new(amount, resulting_balance))
  end

  private

  attr_reader :transaction_class

end
