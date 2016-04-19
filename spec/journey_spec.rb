require 'journey'

describe Journey do 
  let(:oystercard) { double :oystercard }
  let(:entry_station) { double :station, name: "Bank" }
  let(:exit_station) { double :station, name: "Old Street" }
  subject(:journey) { described_class.new }

  it 'check if journey is complete' do
    subject.entry_station = 'Bank'
    expect(subject.journey_complete?).to eq false
  end

  it 'checks that entry station is logged into journey' do
    expect(journey.start(entry_station)).to eq entry_station
  end 

  it 'checks that exit station is logged into journey' do
    expect(journey.finish(exit_station)).to eq exit_station
  end

  context 'when journey is complete' do
    it 'returns minimum fare' do
      allow(journey).to receive(:journey_complete?).and_return(true)
      expect(journey.fare).to eq 1
    end
  end

  context 'when journey is uncomplete' do
    it 'returns penalty fare of 6' do
      allow(journey).to receive(:journey_complete?).and_return(false)
      expect(journey.fare).to eq 6
    end
  end
    
end