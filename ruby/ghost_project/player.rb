class Player
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def alert_invalid_guess(letter)
		puts "'#{letter}' is not a valid move!".capitalize
		puts "1. Your guess must be a letter of the alphabet.".capitalize
		puts "2. You must be able to form a word starting with the new fragment".capitalize
	end

	def display_player
		puts "Player: #{name}"
	end

	def to_s
		name
	end

	def guess(fragment)
		puts "Fragment: #{fragment}"
		puts "Add a letter!".capitalize
		print "> "
		gets.chomp.downcase
	end
end