class Bank

  def initialize
    @activity = []
  end

  def deposit(amount, date = Time.now)
    @activity.push({:date => date, :debit => amount, :credit => 0})
  end

  def withdraw(amount, date = Time.now)
    @activity.push({:date => date, :debit => 0, :credit => -amount})
  end

  def balance
    sum = 0
    @activity.each { |x| sum = (sum + x[:credit] + x[:debit]) }
    sum
  end

  def statement(index)
    result = [header]
    line = @activity[index]
    result.push("#{line[:date]} || #{line[:credit]} || #{line[:debit]} || #{balance[index]}")
    result.each do |x|
      p x
    end
  end

  def header
    "date || credit || debit || balance"
  end

  

end