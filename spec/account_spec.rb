require 'account'

describe Account do

  let(:statement) {double :statement}
  let(:statement_class) {double :statement_class, new: statement}
  let(:transaction_log) {double :transaction_log, add_transaction: nil}
  subject(:account) {described_class.new(transaction_log: transaction_log,
                                        statement_class: statement_class)}


  it "has a balance of zero on opening" do
    expect(subject.balance).to eq(0);
  end

  describe '#deposit' do

    it "increases the account balance by the amount" do
      expect{subject.deposit(10)}.to change{subject.balance}.by(10);
    end

    it "tells the transaction log to log a new transaction" do
      expect(transaction_log).to receive(:add_transaction).with(10,10);
      subject.deposit(10)
    end

  end

  describe '#withdraw' do

    context 'account has a balance' do

      before do
        subject.deposit(100)
      end

      it "reduces the account balance by the amount" do
        expect{subject.withdraw(10)}.to change{subject.balance}.by(-10);
      end

      it "raises an error if withdrawal amount is greater than balance" do
        error_message = 'You do not have enough funds in your account'
        expect{subject.withdraw(110)}.to raise_error NotEnoughFundsError, error_message
      end

      it "tells the transaction log to log a new transaction" do
        expect(transaction_log).to receive(:add_transaction).with(-10,90);
        subject.withdraw(10)
      end

    end

    context 'account is empty' do

      it "raises an error" do
        expect{subject.withdraw(10)}.to raise_error AccountEmptyError, 'Account is empty'
      end

    end

  end

  describe '#print_statement' do

    it "creates a new statement" do
      expect(statement_class).to receive(:new).with(transaction_log)
      subject.print_statement
    end

  end


end
