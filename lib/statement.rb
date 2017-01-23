class Statement

  attr_reader :transaction_log

  def initialize(transaction_log)
    @transaction_log = transaction_log
  end

end
