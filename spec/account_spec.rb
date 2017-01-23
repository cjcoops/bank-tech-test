require 'account'

describe Account do

  subject(:account) {described_class.new}

  it "has a balance of zero on opening" do
    expect(subject.balance).to eq(0);
  end

  describe '#deposit' do

    it "increases the account balance by the amount" do
      expect{subject.deposit(10)}.to change{subject.balance}.by(10);
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

    end

    context 'account is empty' do

      it "raises an error" do
        expect{subject.withdraw(10)}.to raise_error AccountEmptyError, 'Account is empty'
      end

    end

  end


end
