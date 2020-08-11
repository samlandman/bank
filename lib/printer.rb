class Printer

  def self.statement(activity = [])
    result = []
    activity.each do |line|
      result.push(linestatement(line))
    end
    result.push(header)
    result.reverse.map {|x| x}
  end

  def self.header
    "date || credit || debit || balance"
  end
end