class Oystercard

  MAX_LIMIT = 90
  MIN_FARE = 1

  attr_reader :entry_station, :balance

  def initialize
    @balance = 0
    @entry_station = ''
    @journey = {}
  end

  def top_up(money)
    fail "Reach limit of £#{MAX_LIMIT}." if reach_limit?
    @balance += money
  end

  def touch_in(station)
    fail "Not enough fund for this journey" if below_minimum?
    @entry_station = station
    @journey[:entry_station] = entry_station
    true
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @entry_station = nil
    @journey[:exit_station] = station 
  end

  def in_journey?
    entry_station != nil
  end

  def journeys
    @journey
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

