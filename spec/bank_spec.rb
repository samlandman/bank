require 'bank'

describe 'Bank' do
  it 'recognises the method deposit' do
    Bank.deposit(1)
    expect(Bank.balance).to eq(1)
  end
end