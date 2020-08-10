class Bank

  def initialize
    @activity = []
  end

  def deposit(amount)
    @activity.push(amount)
    p @activity
  end

  def withdraw(amount)
    @activity.push(-amount)
    p @activity
  end

  def statement
    ''
  end

  def balance
    sum = 0
    @activity.each { |x| sum+=x}
    p sum
  end

  

end