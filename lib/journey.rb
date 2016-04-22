class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1

  attr_reader :exit_station, :entry_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
  end

  def complete?
    !!(entry_station && exit_station)
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

end