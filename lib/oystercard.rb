require_relative 'journey'

class Oystercard

  MAX_LIMIT = 90
  MIN_FARE = 1

  attr_reader :entry_station, :balance, :journeys, :journey

  def initialize(journey = Journey.new)
    @journey = journey
    @balance = 0
    @entry_station = ''
    @journeys_list = []
  end

  def top_up(money)
    fail "Reach limit of £#{MAX_LIMIT}." if reach_limit?
    @balance += money
  end

  def touch_in(station)
    fail "Not enough fund for this journey" if below_minimum?
    @entry_station = station
    true
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @entry_station = nil
    update_journeys
  end

  def update_journeys
    @journeys_list << journey
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

