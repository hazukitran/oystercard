require 'journey'

describe Journey do 
  let(:oystercard) { double :oystercard }
  let(:station) { double :station, name: "Bank" }

  it 'check if journey is complete' do
  	subject.entry_station = 'Bank'
    expect(subject.journey_complete?).to eq false
  end

  
  
end