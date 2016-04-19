require './lib/oystercard'

#Initialize objects
card = Oystercard.new


#Initialize variables
station = 'Liverpool'

#Scenario_01
card.top_up(10)
card.touch_in(station)
card.entry_station