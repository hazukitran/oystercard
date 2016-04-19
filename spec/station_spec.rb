require 'station'

describe Station do
	
	let(:station) { described_class.new(name: 'Bank', zone: 1) }

	it { expect(station.name).to eq 'Bank' }

	it { expect(station.zone).to eq 1 }


end