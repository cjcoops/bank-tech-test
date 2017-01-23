require 'date'

class Transaction

  attr_reader :date, :resulting_balance
  attr_accessor  :credit, :debit

  def initialize(amount, resulting_balance)
    @date = Time.now.to_date
    @resulting_balance = resulting_balance
    set_credit_or_debit(amount)
  end

  def set_credit_or_debit(amount)
    if amount > 0
      self.credit = amount.to_f
    else
      self.debit = -amount.to_f
    end
  end

end
