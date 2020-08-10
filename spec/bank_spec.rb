require 'bank'



describe 'Bank' do

  before(:each) do
    @bank = Bank.new
  end

  it 'recognises the method deposit, and returns a balance' do
    @bank.deposit(1)
    expect(@bank.balance).to eq(1)
  end

  it 'recognises the method withdraw and returns the correct balance' do
    @bank.deposit(2)
    @bank.withdraw(1)
    expect(@bank.balance).to eq(1)
  end

  it 'recognises the method withdraw, and returns a statement' do
    @bank.deposit(2,"14/01/2012")
    expect(@bank.statement).to eq(["date || credit || debit || balance", "14/01/2012 || 0 || 2 || 2"])
  end

  it 'recognises the method withdraw, deposit and returns a statement' do
    @bank.deposit(2,"14/01/2012")
    @bank.withdraw(1,"15/01/2012")
    expect(@bank.statement).to eq(["date || credit || debit || balance","15/01/2012 || 1 || 0 || 1","14/01/2012 || 0 || 2 || 2"])
  end

end