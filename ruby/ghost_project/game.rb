require "set"
require_relative "player"
class GhostGame 
	ALPHABET = Set.new("a".."z")

	def initialize(*players)
		words = File.readlines("dictionary.txt").map(&:chomp)
		@dictionary = Set.new(words)
		@players = players 
		@fragment = ""
	end

	def current_player
		@players[0]
	end

	def previous_player 
		@players[-1]
	end

	def next_player!
		@players.rotate!
	end

	def take_turn(player)
		system("clear")
		puts "It's #{current_player.name}'s turn!"
		letter = nil
		until letter do 
			letter = player.guess(@fragment)
			unless valid_play?(letter)
				player.alert_invalid_guess
				letter = nil
			end
		end
		@fragment += letter
		puts "#{current_player.name} added the letter '#{letter}' to the fragment."
	end

	def valid_play?(letter)
		return false if !ALPHABET.include?(letter)
		potential_fragment = @fragment + letter 
		@dictionary.any? { |word| word.start_with?(potential_fragment) }
	end

	def is_word?(string)
		@dictionary.include?(string)
	end

	def play_round
		until is_word?(@fragment)
			take_turn(current_player)
			next_player!
		end

		puts "#{current_player.name} wins!"
	end
end

if $PROGRAM_NAME == __FILE__
  game = GhostGame.new(
    Player.new("Roger"), 
    Player.new("Emma"), 
    )

  game.play_round
end