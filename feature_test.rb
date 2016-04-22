require './lib/oystercard'
require './lib/station'
require './lib/journey'
require './lib/journey_log'

#Initialize objects
card = Oystercard.new(JourneyLog.new)
station = Station.new(name: 'Bank', zone: 1)
exit_station = Station.new(name: 'Old Street', zone: 1)
journey = Journey.new
log = JourneyLog.new

#Initialize variables

#Scenario_03
card.top_up(90)
p card.touch_in(station)
p card.touch_out(exit_station)
p station.zone
p exit_station.zone
p journey.entry_zone
p journey.entry_station
p journey.exit_station
p journey.complete?
p log.fare
# p log.journeys
#1 or 6

#Scenario_02
# p station # 2138529375 , @name = 'Bank', @zone = 1

#Scenario_01
# card.top_up(10)
# card.touch_in(station)
# card.entry_station

#journey history
# card.top_up(30)
# card.touch_in(:station)
# card.entry_station 
# card.touch_out(:station)
# card.journeys