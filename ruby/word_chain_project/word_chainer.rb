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
		@all_seen_words = { source => nil }

		until @current_words.empty? || @all_seen_words.has_key?(target)
			new_current_words = explore_current_words
			@current_words = new_current_words
		end

		build_path(target)
	end 

	def explore_current_words
		new_current_words = []
			@current_words.each do |current_word|
				adjacent_words = adjacent_words(current_word)
				adjacent_words.each do |adjacent_word|
					next if @all_seen_words.has_key?(adjacent_word)

					new_current_words << adjacent_word
					@all_seen_words[adjacent_word] = current_word
				end
			end
		new_current_words
	end

	def build_path(target)
		path = [target]
		previous_word = @all_seen_words[target] 
		until previous_word.nil? 
			path << previous_word
			previous_word = @all_seen_words[previous_word]
		end
		path.reverse
	end

	private 
	attr_reader :dictionary 
end

if $PROGRAM_NAME == __FILE__
  # provide file name on command line
  p WordChainer.new(ARGV.shift).run("duck", "ruby")
end