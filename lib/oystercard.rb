require_relative 'journey'

class Oystercard

  MAX_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance, :journey

  def initialize(journey = Journey.new)
    @journey = journey
    @balance = 0
  end

  def top_up(money)
    fail "Reach limit of £#{MAX_LIMIT}." if reach_limit?
    @balance += money
  end

  def touch_in(station)
    fail "Not enough fund for this journey" if below_minimum?
    journey.start(station)
  end

  def touch_out(station)
    journey.finish(station)
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

