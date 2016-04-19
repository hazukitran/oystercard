class Journey

  attr_accessor :entry_station
  attr_reader :exit_station

  def initialize
    @output = {}
    @entry_station = nil
    @exit_station = nil
  end

  def journey_complete?
    !!entry_station && !!exit_station
  end

  # def in_journey?
  #   entry_station != nil
  # end
end