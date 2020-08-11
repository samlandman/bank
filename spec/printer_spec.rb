require 'printer'

describe 'Printer -' do

  describe 'Statement Method:' do

    it 'prints an empty line when no statements' do
      expect(Printer.statement).to eq(['date || credit || debit || balance'])
    end

    it 'returns a printed line when provided with a hash' do
      input = [{ :date => '14/01/2012', :credit => 2, :debit => 0 }]
      expect(Printer.statement(input)).to eq(['date || credit || debit || balance', '14/01/2012 || 2.00 ||  || 2.00'])
    end

  end
  
end