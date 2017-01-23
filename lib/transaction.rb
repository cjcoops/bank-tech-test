require 'date'

class Transaction

  attr_reader :amount, :type, :date

  def initialize(amount: amount)
    @amount = amount
    @type = set_type(amount)
    @date = Time.now.to_date
  end

  def set_type(amount)
    amount > 0 ? :credit : :debit
  end

end
