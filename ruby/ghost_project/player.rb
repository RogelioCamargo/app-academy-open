class Player 
	attr_reader :name 

	def initialize(name)
		@name = name 
	end

	def guess(fragment)
		prompt(fragment)
		gets.chomp.downcase
	end

	def alert_invalid_guess
		puts "Invalid! Try another letter, #{name}."
	end

	def prompt(fragment)
		puts "Current fragment: #{fragment}"
		print "Enter a letter: "
	end

end