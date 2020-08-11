class Printer
  def self.statement
    [header]
  end


  def self.header
    "date || credit || debit || balance"
  end
end