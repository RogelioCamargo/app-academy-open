require "byebug"
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

	def num_exact_matches(code)
		count = 0
		self.pegs.each_with_index do |peg, index|
			count += 1 if peg == code[index]
		end
		count
	end

	def get_indices(pegs)
		indices = Hash.new { |h, k| h[k] = [] }
		pegs.each_with_index do |peg, index|
			indices[peg] << index
		end
		indices
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
		# debugger
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
