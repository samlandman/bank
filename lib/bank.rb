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
    guardfunds(debit)
    updatebalance(-debit)
    updateactivity(0,debit,date)
  end

  def statement(activity = @activity, printer = Printer)
    printer.statement(activity)
  end

  def balance(lines = @activity.length)
    sum = 0

    @activity.each do |x|
      sum = sum - x[:debit] + x[:credit]
    end

    sum == 0 ? '0.00' : twodecimalplaces(sum)
  end

  private

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
    input.to_i <= 0 ? raise('Error, please try again') : true #to_i method catches any string, as to_i on string returns 0
  end

  def guardfunds(input)
    fail 'Insufficient Funds' if (@rolling_balance - input < 0)
  end

end