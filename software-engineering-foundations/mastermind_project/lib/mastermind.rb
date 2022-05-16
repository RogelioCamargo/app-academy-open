require_relative "code"

class Mastermind
	def initialize(length)
		@secret_code = Code.random(length)
	end

	def print_matches(code) 
		puts "Correct: #{@secret_code.num_exact_matches(code)}"
		puts "Near: #{@secret_code.num_near_matches(code)}"
	end	

	def ask_user_for_guess
		puts "Enter a code"
		guess = gets.chomp 
		print_matches(Code.from_string(guess))

		@secret_code.pegs.join("") == guess
	end
end
