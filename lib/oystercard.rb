class Oystercard

  MAX_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance, :journey_log

  def initialize(journey_log = JourneyLog.new)
    @journey_log = journey_log
    @balance = 0
  end

  def top_up(money)
    fail "Reach limit of £#{MAX_LIMIT}." if reach_limit?
    @balance += money
  end

  def touch_in(entry_station)
    fail "Not enough fund for this journey" if below_minimum?
    journey_log.start(entry_station)
  end

  def touch_out(exit_station) 
    journey_log.finish(exit_station)
    deduct(MIN_FARE)
  end

  private

    def reach_limit?
      balance >= MAX_LIMIT
    end

    def below_minimum?
      balance < MIN_FARE
    end

    def deduct(spending)
      @balance -= spending
    end
end

