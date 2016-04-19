class Station

	def initialize(hash)
		@hash = hash
	end

	def name
		@hash[:name]
	end

	def zone
		@hash[:zone]
	end

end