class TransactionLog

  attr_reader :transactions

  def initialize(transaction_class: Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def add_transaction(amount)
    transactions.push(transaction_class.new(amount: 10))
  end

  private

  attr_reader :transaction_class

end
