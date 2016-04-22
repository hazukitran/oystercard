class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @journey_class.start_journey(entry_station)

  end

  def finish(exit_station)
    @journey_class.finish_journey(exit_station)
    @journeys << journey_class
    current_journey
  end

  def journeys
    @journeys.dup   #why @journeys = [] still?
  end

  private 

    def current_journey
      return @journey_class if @journey_class.complete?
      @journey_class = Journey.new
    end
end