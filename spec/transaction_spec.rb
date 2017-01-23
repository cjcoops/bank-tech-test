require 'transaction'

describe Transaction do

  context 'transaction is a credit' do

    subject(:credit) {described_class.new(amount: 10)}

    it "has a type of 'credit' if the amount is positive" do
      expect(subject.type).to equal(:credit)
    end

  end

  context 'transaction is a debit' do

    subject(:debit) {described_class.new(amount: -10)}

    it "has a type of 'debit' if the amount is negative" do
      expect(subject.type).to equal(:debit)
    end

  end


end
