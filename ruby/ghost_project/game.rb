require "set"
require_relative "player.rb"

class GhostGame
	ALPHABET = Set.new("a".."z")

	def initialize(*players)
		words = File.readlines("dictionary.txt").map(&:chomp)	
		@dictionary = Set.new(words)
		@players = players
	end
	
	def play_round
		@fragment = ""

		until is_word?(fragment)
			take_turn
			next_player!
		end
	end

	private

	attr_accessor :fragment
	attr_reader :dictionary, :players

	def welcome
    system("clear")
    puts "Let's play a round of Ghost!".capitalize
  end

	def take_turn
		system("clear")
		current_player.display_player
		letter = nil

		until letter
			letter = current_player.guess(fragment)

			unless valid_play?(letter)
				current_player.alert_invalid_guess(letter)
				letter = nil
			end
		end

		fragment << letter
		puts "#{current_player.name} added the letter '#{letter}' to the fragment".capitalize
		sleep(1)
	end

	def current_player
		players.first
	end

	def previous_player
		players.last
	end

	def next_player! 
		players.rotate!
	end

	def valid_play?(letter)
		return false unless ALPHABET.include?(letter)

		potential_fragment = fragment + letter
		dictionary.any? { |word| word.start_with?(potential_fragment) }
	end

	def is_word?(fragment)
		dictionary.include?(fragment)
	end

end

if $PROGRAM_NAME == __FILE__
	player_one = Player.new("Roger")
	player_two = Player.new("Juan")

	# puts player_one
	# puts player_two

	ghost_game = GhostGame.new(player_one, player_two)
	ghost_game.play_round
end