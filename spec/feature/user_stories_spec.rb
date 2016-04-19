describe 'User Stories' do
  let(:station) { double :station }
  context 'when balance is show' do
    it 'shows default balance of 0' do
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq 0
    end

    it 'shows limit of £90 on oystercard' do
      oystercard = Oystercard.new
      oystercard.top_up(90)
      message = "Reach limit of £90."
      expect { oystercard.top_up(1) }.to raise_error message
    end
  end
  
  context 'when oystercard is being used' do
    it 'allows top up to oystercard' do
      oystercard = Oystercard.new
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end

    it 'allows touch out' do
      oystercard = Oystercard.new
      oystercard.touch_out
      expect { oystercard.touch_out }.not_to raise_error
    end
  end 

  describe '#touch_in' do
    context 'when balance below £1' do
      it 'raise an error' do
        oystercard = Oystercard.new
        oystercard.top_up(0.50)
        oystercard.balance < Oystercard::MIN_FARE
        message = "Not enough fund for this journey" 
        expect { oystercard.touch_in(station) }.to raise_error message 
      end
    end

    context 'when balance above £1' do
      it 'allows touch_in(station)' do
        oystercard = Oystercard.new
        oystercard.top_up(5)
        oystercard.balance > Oystercard::MIN_FARE
        expect(oystercard.touch_in(station)).to be true 
      end
    end
  end

  describe '#in_journey?' do
    context 'when successfully touch in' do
      it 'begins a journey' do
        oystercard = Oystercard.new
        oystercard.top_up(5)
        oystercard.touch_in(station)
        expect(oystercard.in_journey?).to be true
      end
    end

    # context 'when unsuccessfully touch in' do
    #   it 'cannot be on a jounery' do
    #     oystercard = Oystercard.new
    #     oystercard.top_up(0.50)
    #     oystercard.touch_in(station)
    #     expect(oystercard.in_journey?).to be false
    #   end
    # end
  end

  it 'deducts amount after each journey' do
    oystercard = Oystercard.new
    oystercard.top_up(90)
    oystercard.touch_in(station)
    oystercard.touch_out
    expect(oystercard.balance).to eq 89
  end
end










