class Journey

  attr_accessor :entry_station, :output
  attr_reader :exit_station

  def initialize
    @output = {}
  end

  def start(entry_station)
    self.output[:entry_station] = entry_station
  end

  def finish(exit_station)
    self.output[:exit_station] = exit_station
  end

  def journey_complete?
    !!entry_station && !!exit_station
  end

  def fare
    journey_complete? ? 1 : 6
  end
end