require './lib/oystercard'
#initialize
oystercard = Oystercard.new

#journey history
oystercard.top_up(30)
oystercard.touch_in(:station)
oystercard.entry_station 
oystercard.touch_out(:station)
oystercard.journeys
