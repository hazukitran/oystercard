class Oystercard

  MAX_LIMIT = 90

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Maximum limit of £#{Oystercard::MAX_LIMIT}." if balance >= MAX_LIMIT
    self.balance += money
  end

  def deduct(spending)
    self.balance -= spending
  end

  def touch_in
  
  end

  def touch_out

  end

  def in_journey?
    true
  end

end