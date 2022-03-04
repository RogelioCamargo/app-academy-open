class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

	def self.random_word
		DICTIONARY.sample
	end

	def initialize
		@secret_word = Hangman.random_word
		@guess_word = Array.new(@secret_word.length, "_")
		@attempted_chars = []
		@remaining_incorrect_guesses = 5
	end

	def guess_word
		@guess_word
	end

	def attempted_chars
		@attempted_chars
	end

	def remaining_incorrect_guesses
		@remaining_incorrect_guesses
	end

	def already_attempted?(char)
		@attempted_chars.include?(char)
	end

	def get_matching_indices(target)
		matches = []

		@secret_word.each_char.with_index { |char, idx| matches << idx if target == char }

		matches 
	end

	def fill_indices(char, indexes)
		indexes.each do |idx|
			@guess_word[idx] = char
		end
	end

	def try_guess(char)
		if self.already_attempted?(char)
			puts "that has already been attempted"
			false
		else 
			@attempted_chars << char

			indexes = self.get_matching_indices(char)
			if indexes.length != 0
				self.fill_indices(char, indexes)
			else
				@remaining_incorrect_guesses -= 1
			end
			true
		end
	end

	def ask_user_for_guess
		puts "Enter a char: "
		char = gets.chomp

		self.try_guess(char)
	end

	def win?
		if @guess_word.join("") == @secret_word
			puts "WIN"
			true
		else
			false
		end
	end

	def lose?
		if @remaining_incorrect_guesses == 0
			puts "LOSE"
			true
		else
			false
		end
	end

	def game_over?
		if self.win? || self.lose? 
			puts @secret_word
			true
		else
			false
		end
	end
end
