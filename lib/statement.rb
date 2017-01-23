class Statement

  LAYOUT = "%-15s %s %-10s %s %-10s %s %-10s\n"

  attr_reader :transaction_log

  def initialize(transaction_log)
    @transaction_log = transaction_log
  end

  def print_statement

    printf(LAYOUT, "date", "||", "credit",  "||", "debit",  "||", "balance")

    transaction_log.transactions.each do |t|
      printf(LAYOUT, t.date, "||",t.credit,"||", t.debit, "||",t.resulting_balance)
    end

  end

end
