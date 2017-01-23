require 'account'

describe Account do

  subject(:account) {described_class.new}

  it "has a balance of zero on opening" do
    expect(account.balance).to eq(0);
  end

  describe '#deposit' do

    it "increases the account balance by the amount" do
      expect{account.deposit(10)}.to change{account.balance}.by(10);
    end

  end


end
