class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

	attr_reader :pegs 

	def self.random(length)
		pegs = []
		length.times { pegs << POSSIBLE_PEGS.keys.sample }
		Code.new(pegs)
	end

	def self.from_string(string_pegs)
		pegs = string_pegs.split("")
		Code.new(pegs)
	end

	def self.valid_pegs?(pegs)
		pegs.each do |peg|
			return false if !POSSIBLE_PEGS.has_key?(peg.upcase)
		end
		true
	end

	def initialize(pegs)
		if !Code.valid_pegs?(pegs)
			raise 'not valid pegs'
		end 

		@pegs = pegs.map { |peg| peg.upcase }
	end

	def [](index)
		@pegs[index]
	end

	def length
		@pegs.length
	end
end
