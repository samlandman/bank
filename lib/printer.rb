class Printer

  def self.statement(activity = [])
    result = []
    activity.each do |line|
      result.push(linestatement(line, activity))
    end
    result.push(header)
    result.reverse.map {|i| i}
  end

  def self.linestatement(line, activity)
    index = activity.find_index(line)
    rolling_balance1(activity,index)

    if line[:rolling_balance] == 0
      rolling_balance = "0.00"
      else
      rolling_balance = rolling_balance1(activity,index)
    end

    "#{line[:date]} || #{twodecimalplaces(line[:credit])} || #{twodecimalplaces(line[:debit])} || #{rolling_balance}"
  end

  def self.rolling_balance1(activity, index)
    sum = 0

    (0..index).map do |int|
      sum += activity[int][:credit]-activity[int][:debit]
    end

    twodecimalplaces(sum)
  end

  def self.header
    "date || credit || debit || balance"
  end

  def self.twodecimalplaces(integer)
    if integer > 0 
      return ('%.2f' % integer)
    end
  end

end