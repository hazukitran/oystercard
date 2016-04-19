class Journey

  def initialize(complete_journey = {})
    @journey = complete_journey
    @entry_station = nil
    @exit_station = nil
  end

  def check_journey
    if @journey[entry_station] != nil
      in_journey?
    else
      @journeys[:entry_station] == nil || @journeys[:exit_station] == nil
    end
  end

  # def in_journey?
  #   entry_station != nil
  # end
end