require 'bank'

describe 'Bank' do

  before(:each) do
    @bank = Bank.new
  end

  it 'recognises the method deposit of 1, and returns a balance of 1.00' do
    @bank.deposit(1)
    expect(@bank.balance).to eq('1.00')
  end

  it 'expects bank balance to be £0 on initialize' do
    expect(@bank.balance).to eq('0.00')
  end

  it 'recognises the method withdraw and returns the correct balance of 0.00' do
    @bank.deposit(2)
    @bank.withdraw(2)
    expect(@bank.balance).to eq('0.00')
  end

  it 'recognises the method withdraw and deposit and returns the correct balance of 1.00' do
    @bank.deposit(2)
    @bank.withdraw(1)
    expect(@bank.balance).to eq('1.00')
  end

  it 'recognises the method withdraw with a date, and returns a statement' do
    expect(@bank.statement).to eq(['date || credit || debit || balance'])
  end

  it 'recognises the method withdraw with a date, and returns a statement' do
    @bank.deposit(2,'14/01/2012')
    expect(@bank.statement).to eq(['date || credit || debit || balance', '14/01/2012 || 2.00 ||  || 2.00'])
  end

  it 'recognises the method withdraw and deposit with a date and returns a statement' do
    @bank.deposit(2,'14/01/2012')
    @bank.withdraw(1,'15/01/2012')
    expect(@bank.statement).to eq(['date || credit || debit || balance','15/01/2012 ||  || 1.00 || 1.00','14/01/2012 || 2.00 ||  || 2.00'])
  end

  it 'recognises the method withdraw, deposit and returns a statement' do
    @bank.deposit(1000,'10/01/2012')
    @bank.deposit(2000,'13/01/2012')
    @bank.withdraw(500,'14/01/2012')
    expect(@bank.statement).to eq(['date || credit || debit || balance','14/01/2012 ||  || 500.00 || 2500.00','13/01/2012 || 2000.00 ||  || 3000.00','10/01/2012 || 1000.00 ||  || 1000.00'])
  end

  it 'guards against possible misuse by raising an error if the input is not a number' do
    expect { @bank.deposit('a') }.to raise_error('Error, please try again')
  end

  it 'guards against possible misuse by raising an error if the input is not a number greater than 1 for a credit, and less than one for a debit' do
    expect { @bank.deposit(-1) }.to raise_error('Error, please try again')
  end

  it 'guards against possible misuse by raising an error if debit would lead the bank to go below 1' do
    expect { @bank.withdraw(1) }.to raise_error('Insufficient Funds')
  end

end