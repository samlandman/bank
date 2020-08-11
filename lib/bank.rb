class Bank

  def initialize
    @activity = []
    @rolling_balance = 0
  end

  def deposit(credit, date = Time.now.strftime("%d/%m/%Y"))
    guard(credit)
    updatebalance(credit)
    updateactivity(credit,0,date)
  end

  def withdraw(debit, date = Time.now)
    guard(debit)
    updatebalance(-debit)
    updateactivity(0,debit,date)
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
      sum = sum - x[:debit] + x[:credit]
    end

    sum == 0 ? '0.00' : twodecimalplaces(sum)
  end

  private

  def header
    "date || credit || debit || balance"
  end

  def linestatement(line)
    index = @activity.find_index(line)

    if line[:rolling_balance] == 0
      rolling_balance = "0.00"
      else
      rolling_balance = twodecimalplaces(line[:rolling_balance])
    end

    "#{line[:date]} || #{twodecimalplaces(line[:credit])} || #{twodecimalplaces(line[:debit])} || #{rolling_balance}"
  end

  def twodecimalplaces(integer)
    if integer > 0 
      return ('%.2f' % integer)
    end
  end

  def updatebalance(amount)
    @rolling_balance += amount
  end

  def updateactivity(credit,debit,date)
    @activity.push({:date => date, :credit => credit, :debit => debit, :rolling_balance => @rolling_balance})
  end

  def guard(input)
    fail unless input > 0
  end

end