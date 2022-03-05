require_relative "code"

class Mastermind
	def initialize(length)
		@secret_code = Code.random(length)
	end

	def print_matches(code)
		puts "#{@secret_code.num_exact_matches(code)} matches"
		puts "#{@secret_code.num_near_matches(code)} near matches"
	end

	def ask_user_for_guess
		puts "Enter a code: "
		code_string = gets.chomp
		code_guess = Code.from_string(code_string)

		print_matches(code_guess)

		@secret_code == code_guess ? true : false
	end
end
