class Bank

  def initialize
    @activity = []
    @rolling_balance = 0
  end

  def deposit(amount, date = Time.now)
    updatebalance(amount)
    @activity.push({:date => date, :debit => amount, :credit => 0, :rolling_balance => @rolling_balance})
  end

  def withdraw(amount, date = Time.now)
    updatebalance(-amount)
    @activity.push({:date => date, :debit => 0, :credit => amount, :rolling_balance => @rolling_balance})
  end

  def statement
    result = []
    @activity.each do |line|
      result.push(linestatement(line))
    end
    result.push(header)
    result.reverse.map {|x| x}
  end

  def balance(lines = @activity.length)
    sum = 0

    @activity.each do |x|
      sum = sum - x[:credit] + x[:debit]
    end

    return twodecimalplaces(sum)
  end

  private

  def header
    "date || credit || debit || balance"
  end

  def linestatement(line)
    index = @activity.find_index(line)
    "#{line[:date]} || #{twodecimalplaces(line[:debit])} || #{twodecimalplaces(line[:credit])} || #{twodecimalplaces(line[:rolling_balance])}"
  end

  def twodecimalplaces(integer)
    if integer > 0 
      return ('%.2f' % integer)
    end
  end

  def updatebalance(amount)
    @rolling_balance += amount
  end

end