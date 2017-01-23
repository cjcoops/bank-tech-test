class Statement

  LAYOUT = "%-15s %s %-10s %s %-10s %s %-10s\n"
  NUMBER_FORMAT = '%.2f'

  attr_reader :transaction_log

  def initialize(transaction_log)
    @transaction_log = transaction_log
    print_statement
  end

  def print_statement

    printf(LAYOUT, "date", "||", "credit",  "||", "debit",  "||", "balance")
    transaction_log.transactions.reverse.each do |transaction|
      printf(LAYOUT,  convert_date(transaction.date), "||",
                      convert_amount(transaction.credit),"||",
                      convert_amount(transaction.debit), "||",
                      convert_amount(transaction.resulting_balance))
    end

  end

  private

  def convert_amount(amount)
    if amount
      '%.2f' % amount
    end
  end

  def convert_date(date)
    date.strftime("%e/%m/%Y")
  end

end
