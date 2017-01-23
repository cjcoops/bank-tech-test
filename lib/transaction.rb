class Transaction

  attr_reader :amount
  attr_reader :type

  def initialize(amount: amount)
    @amount = amount
    @type = set_type(amount)
  end

  def set_type(amount)
    amount > 0 ? :credit : :debit
  end

end
