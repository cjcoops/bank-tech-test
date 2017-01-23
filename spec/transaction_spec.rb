require 'transaction'
require 'timecop'

describe Transaction do

  before do
    Timecop.freeze(Time.now)
  end

  after do
    Timecop.return
  end

  subject(:transaction) {described_class.new(10, 100)}

  it "has a date" do
    expect(subject.date).to eq(Time.now.to_date)
  end

  it "has a resulting balance" do
    expect(subject.resulting_balance).to equal(100)
  end

  context 'transaction is positive' do

    subject(:credit) {described_class.new(10, 100)}

    it "has a type of 'credit'" do
      expect(subject.type).to equal(:credit)
    end

  end

  context 'transaction is negative' do

    subject(:debit) {described_class.new(-10, 100)}

    it "has a type of 'debit'" do
      expect(subject.type).to equal(:debit)
    end

  end


end
