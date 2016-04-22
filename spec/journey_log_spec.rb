require 'journey_log'

describe JourneyLog do

  subject(:journey_log) { described_class.new(journey_class) }
  let(:journey_class) { double :journey_class, entry_station: entry_station, exit_station: exit_station }
  let(:entry_station) { double :station, name: "Bank", zone: 1 }
  let(:exit_station) { double :station, name: "Waterloo", zone: 2 }

  describe "#start" do
    it 'a new journey' do
      allow(journey_class).to receive(:complete?)
      expect(journey_class).to receive(:start_journey).with(entry_station)
      journey_log.start(entry_station)
    end
  end

  describe "#finish" do
    it 'update journey with exit station' do
      allow(journey_class).to receive(:complete?)
      expect(journey_class).to receive(:finish_journey).with(exit_station)
      journey_log.finish(exit_station)
    end
  end

  describe "#journeys" do
    it 'returns a list of previous journey' do
      allow(journey_class).to receive(:start_journey)
      allow(journey_class).to receive(:finish_journey)
      allow(journey_class).to receive(:complete?)
      journey_log.start(entry_station)
      journey_log.finish(exit_station)
      expect(journey_log.journeys).to include journey_class
    end
  end

  describe "#fare" do
    before do
      allow(journey_class).to receive(:start_journey)
      allow(journey_class).to receive(:finish_journey)
      allow(journey_class).to receive(:complete?)
    end

    context 'when journey is complete' do
      it 'returns minimum fare' do
        journey_log.start(entry_station)
        journey_log.finish(exit_station)
        allow(journey_class).to receive(:complete?).and_return(true)
        expect(journey_log.fare).to eq 1
      end
    end

    context 'when journey is uncomplete' do
      it 'returns penalty fare of 6' do
        journey_log.start(entry_station)
        allow(journey_class).to receive(:complete?).and_return(false)
        expect(journey_log.fare).to eq 6
      end
    end

    context 'given 2 different stations' do

      it 'calculates the fare between zone 1 & 2' do
        journey_log.start(entry_station)
        journey_log.finish(exit_station)
        allow(journey_class).to receive(:complete?).and_return(true)
        expect(journey_log.fare).to eq 2
      end
    end
  end
end