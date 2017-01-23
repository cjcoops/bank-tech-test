require 'account'

describe Account do

  subject(:account) {described_class.new}

  it "has a balance of zero on opening" do
    expect(account.balance).to eq(0);
  end

end
