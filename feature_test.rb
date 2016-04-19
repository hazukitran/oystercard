require './lib/oystercard'
require './lib/station'
require 'journey'

#Initialize objects
card = Oystercard.new
station = Station.new(name: 'Bank', zone: 1)
journey = Journey.new

#Initialize variables

#Scenario_03
card.touch_in
card.touch_out
journey.journey_complete?
card.fare

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