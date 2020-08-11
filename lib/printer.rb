class Printer

  def self.statement(activity = [])
    result = []
    activity.each do |line|
      result.push(linestatement(line, activity))
    end
    result.push(header)
    result.reverse.map {|i| i}
  end

  private

  def self.linestatement(line, activity)
    index = activity.find_index(line)
    "#{line[:date]} || #{twodecimalplaces(line[:credit])} || #{twodecimalplaces(line[:debit])} || #{rolling_balance(activity,index)}"
  end

  def self.rolling_balance(activity, index)
    sum = 0
    (0..index).map do |int|
      sum += activity[int][:credit]-activity[int][:debit]
    end
    sum == 0 ? '0.00' : twodecimalplaces(sum)
  end

  def self.header
    'date || credit || debit || balance'
  end

  def self.twodecimalplaces(integer)
    if integer > 0 
      '%.2f' % integer
    end
  end

end