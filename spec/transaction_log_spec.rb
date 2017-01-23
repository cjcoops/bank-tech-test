require 'transaction_log'

describe TransactionLog do

  subject(:transaction_log) {described_class.new}

  it "is empty to begin with" do
    expect(subject.transactions).to be_empty
  end

end
