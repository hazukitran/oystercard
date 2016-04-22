class JourneyLog

  PENALTY_FARE = 6
  MIN_FARE = 1

  attr_reader :journey_class

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @journeys = []
    @entry_zone = nil
    @exit_zone = nil
  end

  def start(entry_station)
    @journey_class.start_journey(entry_station)
    @entry_zone = @journey_class.entry_station.zone
    entry_station
  end

  def finish(exit_station)
    @journey_class.finish_journey(exit_station)
    @exit_zone = @journey_class.exit_station.zone
    @journeys << journey_class
    current_journey
  end

  def journeys
    @journeys.dup
  end

  def fare
    @journey_class.complete? ? amount : PENALTY_FARE
  end

  private

    def amount
      # binding.pry
      diff = (@exit_zone - @entry_zone).abs
      diff + MIN_FARE
    end

    def current_journey
      return @journey_class if @journey_class.complete?
      @journey_class = Journey.new
    end
end