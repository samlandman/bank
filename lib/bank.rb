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
    return sum
  end

  def statement
    result = [header]
    line = @activity[0]
    result.push(linestatement(line))
    result.map {|x| p x}
  end

  def header
    "date || credit || debit || balance"
  end

  def linestatement(line)
    "#{line[:date]} || #{line[:credit]} || #{line[:debit]} || #{balance}"
  end

end