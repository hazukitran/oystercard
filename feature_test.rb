require './lib/oystercard'
require './lib/station'
require './lib/journey'

#Initialize objects
card = Oystercard.new
station = Station.new(name: 'Bank', zone: 1)
journey = Journey.new

#Initialize variables

#Scenario_03
card.top_up(90)
card.touch_in(station)
p journey # 13545641, @entry_station = 'Bank', @exit_station = nil
puts
p journey.journey_complete? # FALSE
card.touch_out(station2)
p journey.journey_complete? # TRUE
puts
p journey.output # {entry_station: 'Bank', exit_station: 'Epping'}
p card.journeys_list # [{entry_station: 'Bank', exit_station: 'Epping'}]

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