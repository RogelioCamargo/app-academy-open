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

	def num_exact_matches(code)
		count = 0
		code.pegs.each_with_index do |char, idx|
			count += 1 if (char == self[idx])
		end
		count
	end

	def num_near_matches(code)
		code_dup = self.pegs.dup
		guess_dup = code.pegs.dup

		guess_dup.each_with_index do |char, idx|
			if code_dup[idx] == guess_dup[idx]
				code_dup[idx] = nil
				guess_dup[idx] = nil
			end
		end

		code_dup.delete(nil)
		guess_dup.delete(nil)

		count = 0
		guess_dup.each_with_index do |char, idx|
			if code_dup.include?(char)
				count += 1
				code_dup.delete_at(code_dup.index(char))
			end
		end

		count
	end

	def ==(code)
		self.pegs == code.pegs
	end

end
