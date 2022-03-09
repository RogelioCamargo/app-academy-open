require "set"
require_relative "player.rb"

class GhostGame
	ALPHABET = Set.new("a".."z")
	MAX_LOSS_COUNT = 5

	def initialize(*players)
		words = File.readlines("dictionary.txt").map(&:chomp)	
		@dictionary = Set.new(words)
		@players = players
		@losses = Hash.new { |losses, player| losses[player] = 0 }
	end

	def run
		play_round until game_over?
		puts "#{winner} wins!".capitalize
	end

	private

	attr_reader :dictionary, :players, :losses, :fragment

	def play_round
		@fragment = ""
		welcome

		until round_over?
			take_turn
			next_player!
		end

		update_standings
	end

	def game_over?
		remaining_players == 1
	end

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
		puts "#{current_player} added the letter '#{letter}' to the fragment".capitalize
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

    players.rotate! until losses[current_player] < MAX_LOSS_COUNT
	end

	def remaining_players
    losses.count { |k, v| v < MAX_LOSS_COUNT }
  end

	def winner
		losses.find { |k, v| v < MAX_LOSS_COUNT }
	end

	def record(player)
		count = losses[player]
		"GHOST".slice(0, count)
	end

	def display_standings
		puts "Current standings: ".capitalize

		players.each do |player|
			puts "#{player}: #{record(player)}"
		end

		sleep(2)
	end

	def valid_play?(letter)
		return false unless ALPHABET.include?(letter)

		potential_fragment = fragment + letter
		dictionary.any? { |word| word.start_with?(potential_fragment) }
	end

	def is_word?(fragment)
		dictionary.include?(fragment)
	end

	def round_over?
		is_word?(fragment)
	end

	def update_standings
    system("clear")
    puts "#{previous_player} spelled #{fragment}.".capitalize
    puts "#{previous_player} gets a letter!".capitalize
    sleep(1)

    if losses[previous_player] == MAX_LOSS_COUNT - 1
      puts "#{previous_player} has been eliminated!".capitalize
      sleep(1)
    end
    
    losses[previous_player] += 1
    
    display_standings
  end
end

if $PROGRAM_NAME == __FILE__
	player_one = Player.new("Roger")
	player_two = Player.new("Juan")

	# puts player_one
	# puts player_two

	ghost_game = GhostGame.new(player_one, player_two)
	ghost_game.run
end