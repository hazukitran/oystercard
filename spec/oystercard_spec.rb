require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:entry_station) { double(:entry_station, name: 'Bank') }
  let(:exit_station) { double(:exit_station, name: 'Old Street') }
  let(:journey) { {entry_station: entry_station, exit_station: exit_station}}

  it 'defaults with balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  it 'can be topped up' do
    oystercard.top_up(10)
    expect(oystercard.balance).to eq 10
  end

  it 'takes maximum balance of £90' do
    oystercard.top_up(Oystercard::MAX_LIMIT)
    message = "Reach limit of £#{Oystercard::MAX_LIMIT}."
    expect { oystercard.top_up(1) }.to raise_error message
  end

  it 'deducts amount after each journey' do
    oystercard.top_up(90)
    oystercard.touch_in(entry_station)
    expect{ oystercard.touch_out(exit_station) }.to change{oystercard.balance }.by(-1)
  end

  it 'records the journey' do
    oystercard.top_up(30)
    oystercard.touch_in(entry_station)
    oystercard.touch_out(exit_station)
    expect(oystercard.journeys).to eq journey
  end

  describe '#touch_in' do
    context 'when balance below £1' do
      it 'raises an error' do
        oystercard.top_up(0.50)
        message = "Not enough fund for this journey" 
        expect { oystercard.touch_in(entry_station) }.to raise_error message
      end
    end

    context 'when balance above £1' do
      it 'allows touch in' do
        oystercard.top_up(5)
        expect(oystercard.touch_in(entry_station)).to be true
      end
    end

    context 'logs journey' do
      it 'entry entry_station' do
        oystercard.top_up(10)
        oystercard.touch_in(entry_station)
        expect(oystercard.entry_station).to eq entry_station
      end
    end
  end

  describe '#in_journey?' do
    context 'when successfully touch in' do      
      it 'begins on a journey' do
        oystercard.top_up(5)
        oystercard.touch_in(entry_station)
        expect(oystercard.in_journey?).to be true
      end
    end
  end

  describe '#touch_out' do
    it 'return nil for entry_station when touch_out' do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.entry_station).to eq nil
    end
  end

end