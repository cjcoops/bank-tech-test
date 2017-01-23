require 'date'

class Transaction

  attr_reader :amount, :type, :date, :resulting_balance

  def initialize(amount, resulting_balance)
    @amount = amount
    @type = set_type(amount)
    @date = Time.now.to_date
    @resulting_balance = resulting_balance
  end

  def set_type(amount)
    amount > 0 ? :credit : :debit
  end

end
