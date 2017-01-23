require 'transaction_log'

describe TransactionLog do

  let(:transaction) {double :transaction}
  let(:transaction_class) {double :transaction_class, new: transaction}
  subject(:transaction_log) {described_class.new(transaction_class: transaction_class)}

  it "is empty to begin with" do
    expect(subject.transactions).to be_empty
  end

  describe '#add_transaction' do

    it "creates a new transaction" do
      expect(transaction_class).to receive(:new).with(10, 100);
      subject.add_transaction(10, 100)
    end

    it "stores the transaction in transactions" do
      subject.add_transaction(10, 100)
      expect(subject.transactions).to include(transaction)
    end

  end

end
