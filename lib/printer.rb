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
    i = 0
    loop do
      p index
      p activity[i]
      p activity[i][:credit]-activity[i][:debit]
      p "sum: #{sum}"
      sum += activity[i][:credit]-activity[i][:debit]
      p "rolling balance: #{sum}"
      if i >= index - 1 
        break 
      else
        i += 1
      end
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