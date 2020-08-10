require 'bank'



describe 'Bank' do
  before(:each) do
    @bank = Bank.new
  end
  it 'recognises the method deposit' do
    @bank.deposit(1)
    expect(@bank.balance).to eq(1)
  end

  it 'recognises the method withdraw' do
    @bank.deposit(2)
    @bank.withdraw(1)
    expect(@bank.balance).to eq(1)
  end
end