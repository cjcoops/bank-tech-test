require 'statement'

describe Statement do

  let(:date) {Time.now.to_date}
  let(:transaction_1) {double :transaction, date: date, credit: 10, debit: nil, resulting_balance: 100.00}
  let(:transaction_2) {double :transaction, date: date, credit: nil, debit: 5.00, resulting_balance: 95.00}
  let(:transactions) do [transaction_1, transaction_2] end
  let(:transaction_log) {double :transaction_log, transactions: transactions}
  subject(:statement) {described_class.new(transaction_log)}


  it "is initialized with a transaction log" do
    expect(subject.transaction_log).to equal(transaction_log)
  end

  describe "#print" do

    it "should print a line of the statement" do
      headers = "date            || credit     || debit      || balance"
      first_row = "23/01/2017      || 10.00      ||            || 100.00"
      second_row = "23/01/2017      ||            || 5.00       || 95.00"
      expect { printf(headers) }.to output.to_stdout
      expect { printf(headers) }.to output.to_stdout
      expect { printf(headers) }.to output.to_stdout
      subject.print_statement
    end
  end

end
