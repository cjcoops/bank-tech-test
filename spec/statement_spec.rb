require 'statement'

describe Statement do

  let(:date) {Time.now.to_date}
  let(:transaction_1) {double :transaction, date: date, credit: 10, debit: nil, resulting_balance: 100}
  let(:transaction_2) {double :transaction, date: date, credit: nil, debit: 5, resulting_balance: 95}
  let(:transactions) do [transaction_1, transaction_2] end
  let(:transaction_log) {double :transaction_log, transactions: transactions}
  subject(:statement) {Statement.new(transaction_log)}


  it "is initialized with a transaction log" do
    expect(subject.transaction_log).to equal(transaction_log)
  end

  describe "#print" do

    it "should print a line of the statement" do
      # expect(STDOUT).to receive(:printf).with("%-10s %s\n", 10, nil, 100)
      subject.print_statement
    end
  end

end
