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

  it 'takes maximum balance of £90' do
    oystercard.top_up(Oystercard::MAX_LIMIT)
    message = "Reach limit of £#{Oystercard::MAX_LIMIT}."
    expect { oystercard.top_up(1) }.to raise_error message
  end

  describe '#touch_in' do
    context 'when balance below £1' do
      it 'raises an error' do
        oystercard.top_up(0.50)
        message = "Not enough fund for this journey" 
        expect { oystercard.touch_in }.to raise_error message
      end
    end

    context 'when balance above £1' do
      it 'allows touch in' do
        oystercard.top_up(5)
        expect(oystercard.touch_in).to be true
      end
    end
  end

  describe '#in_journey?' do
    context 'when successfully touch in' do
      it 'begins on a journey' do
        oystercard.top_up(5)
        oystercard.touch_in
        expect(oystercard.in_journey?).to be true
      end
    end

    # context 'when unsuccessfully touch in' do
    #   it 'cannot be on a journey' do
    #     oystercard.top_up(0.50)
    #     oystercard.touch_in
    #     expect(oystercard.in_journey?).to be false
    #   end
    # end
  end

  it 'deducts amount after each journey' do
    oystercard.top_up(90)
    oystercard.touch_in
    expect{ oystercard.touch_out }.to change{oystercard.balance }.by(-1)
  end

  describe '#touch_out' do
    it { is_expected.to respond_to :touch_out }
  end 

end