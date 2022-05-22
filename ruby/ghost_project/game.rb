require "set"
require_relative "player"
class GhostGame 
	ALPHABET = Set.new("a".."z")
	MAX_LOSS_COUNT = 5

	def initialize(*players)
		words = File.readlines("dictionary.txt").map(&:chomp)
		@dictionary = Set.new(words)
		@players = players 
		losses = Hash.new
		players.each { |player| losses[player] = 0 }
		@losses = losses
	end

	def run 
		until game_over? do 
			play_round
			display_standings
		end
	end

	private 

	

	def play_round
		@fragment = ""

		until round_over?
			take_turn
			next_player!
		end

		puts "#{previous_player.name} loses this round!"
		@losses[previous_player] += 1
	end

	def game_over? 
		@losses.one? { |_, loss_count| loss_count < MAX_LOSS_COUNT }
	end

	def round_over? 
		is_word?(@fragment)
	end

	def current_player
		@players[0]
	end

	def previous_player 
		(@players.length - 1).downto(0).each do |i|
			player = @players[i]
			return player if @losses[player] < MAX_LOSS_COUNT
		end
	end

	def next_player!
		@players.rotate!
	end

	def take_turn
		puts "It's #{current_player.name}'s turn!"
		letter = nil
		until letter do 
			letter = current_player.guess(@fragment)
			unless valid_play?(letter)
				current_player.alert_invalid_guess
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

	def display_standings 
		puts "SCOREBOARD"
		@losses.keys.each do |player|
			puts "#{player.name}: #{record(player)}"
		end
	end

	def record(player)
		losses_count = @losses[player]
		"GHOST"[0...losses_count]
	end
end

if $PROGRAM_NAME == __FILE__
  game = GhostGame.new(
    Player.new("Roger"), 
    Player.new("Emma"), 
		Player.new("Judy")
    )

  game.run
end