class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

	attr_reader :pegs

	def self.valid_pegs?(pegs)
		pegs.each { |char| return false if !POSSIBLE_PEGS.has_key?(char.upcase) }

		true
	end

	def self.random(length)
		pegs = Array.new(length) { POSSIBLE_PEGS.keys.sample }
		
		Code.new(pegs)
	end

	def self.from_string(string)
		Code.new(string.split(""))
	end

	def initialize(pegs)
		if Code.valid_pegs?(pegs)
			@pegs = pegs.map(&:upcase)
		else
			raise "invalid pegs"
		end
	end

	def [](position)
		@pegs[position]
	end

	def length
		@pegs.length
	end
end
