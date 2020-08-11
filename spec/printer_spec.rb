require 'printer'

describe 'Printer' do

  before(:each) do
  end

  it 'prints an empty line when no statements' do
    expect(Printer.statement).to eq(["date || credit || debit || balance"])
  end

end