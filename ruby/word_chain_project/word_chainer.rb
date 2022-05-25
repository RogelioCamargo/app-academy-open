require "set"
class WordChainer 
	def initialize(filename)
		words = File.readlines(filename).map(&:chomp)
		@dictionary = Set.new(words)
	end

	def adjacent_words(word)
		adjacent_words = []
		word.each_char.with_index do |char, index|
			("a"..."z").each do |new_char|
				next if char.downcase == new_char
				new_word = word[0..-1]
				new_word[index] = new_char
				adjacent_words << new_word if dictionary.include?(new_word)
			end
		end
		adjacent_words
	end

	def run(source, target)
		@current_words = [source]
		@all_seen_words = Set.new([source])

		until @current_words.empty? 
			new_current_words = explore_current_words(@current_words, @all_seen_words)
			p new_current_words
			@current_words = new_current_words
		end
	end 

	def explore_current_words(current_words, all_seen_words)
		new_current_words = []
			current_words.each do |current_word|
				adjacent_words = adjacent_words(current_word)
				adjacent_words.each do |adjacent_word|
					next if all_seen_words.include?(adjacent_word)

					new_current_words << adjacent_word
					all_seen_words.add(adjacent_word)
				end
			end
		new_current_words
	end

	private 
	attr_reader :dictionary 
end