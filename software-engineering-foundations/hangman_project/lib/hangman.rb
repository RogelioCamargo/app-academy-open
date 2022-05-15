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
		attempted_chars.include?(char)
	end

	def get_matching_indices(char_guess)
		matches = []
		@secret_word.each_char.with_index do |char, index|
			matches << index if char === char_guess.downcase
		end
		matches
	end

	def fill_indices(char, indices)
		indices.each do |index|
			@guess_word[index] = char
		end
	end

	def try_guess(char)
		if already_attempted?(char)
			puts "that has already been attempted"
			return false 
		else 
			@attempted_chars << char 
			indices = get_matching_indices(char)
			if (indices.length == 0)
				@remaining_incorrect_guesses -= 1
			else 
				fill_indices(char, indices)
			end
			return true
		end
	end

	def ask_user_for_guess
		puts 'Enter a char:'
		char_guess = gets.chomp
		try_guess(char_guess)
	end

	def win?
		if guess_word.join("") == @secret_word
			puts 'WIN'
			return true 
		else 
			return false 
		end
	end

	def lose? 
		if remaining_incorrect_guesses == 0
			puts 'LOSE'
			return true 
		else 
			return false 
		end
	end

	def game_over? 
		if win? || lose?
			puts @secret_word
			return true 
		else 
			return false 
		end
	end
end
