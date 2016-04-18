require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it 'defaults with balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  it 'can be topped up' do
    oystercard.top_up(10)
    expect(oystercard.balance).to eq 10
  end

  it 'takes maximum balance of 90' do
    oystercard.top_up(Oystercard::MAX_LIMIT)
    message = "Maximum limit of £#{Oystercard::MAX_LIMIT}."
    expect { oystercard.top_up(1) }.to raise_error message
  end

  it 'deduct money when used' do
    oystercard.top_up(30)
    oystercard.deduct(15)
    expect(oystercard.balance).to eq 15
  end

  describe '#touch_in' do
    it { is_expected.to respond_to :touch_in }
  end

  describe '#touch_out' do
    it { is_expected.to respond_to :touch_out }
  end 

  describe '#in_journey' do
    it 'is in journey' do
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end
  end
end