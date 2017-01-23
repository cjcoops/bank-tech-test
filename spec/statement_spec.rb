require 'statement'

describe Statement do

  let(:transaction_1) {double :transaction}
  let(:transaction_2) {double :transaction}
  let(:transactions) do [transaction_1, transaction_2] end
  let(:transaction_log) {double :transaction_log, transactions: transactions}
  subject(:statement) {Statement.new(transaction_log)}


  it "is initialized with a transaction log" do
    require 'pry'; binding.pry
    expect(subject.transaction_log).to equal(transaction_log)
  end

  describe "#print" do

  end

end
