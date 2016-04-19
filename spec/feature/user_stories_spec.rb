describe 'User Stories' do

  context 'when there\'s balance' do
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

    it 'deducts fare from oystercard' do
      oystercard = Oystercard.new
      oystercard.top_up(90)
      oystercard.deduct(30)
      expect(oystercard.balance).to eq 60 
    end

    it 'allows touch in' do
      oystercard = Oystercard.new
      oystercard.top_up(90)
      expect { oystercard.touch_in }.not_to raise_error
    end

    it 'check if you\'re in journey' do
      oystercard = Oystercard.new
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end

    it 'allows touch out' do
      oystercard = Oystercard.new
      oystercard.touch_in
      expect { oystercard.touch_out }.not_to raise_error
    end
  end 
end
