require 'journey'

describe Journey do 
  
  let(:oystercard) { double :oystercard }
  let(:entry_station) { double :station, name: "Bank", zone: 1 }
  let(:exit_station) { double :station, name: "Waterloo", zone: 2 }
  subject(:journey) { described_class.new }

  it 'check if journey is complete' do
    journey.start_journey(entry_station)
    expect(journey.complete?).to eq false
  end

  it 'checks that entry station is logged into journey' do
    expect(journey.start_journey(entry_station)).to eq entry_station
  end 

  it 'checks that exit station is logged into journey' do
    expect(journey.finish_journey(exit_station)).to eq exit_station
  end

end