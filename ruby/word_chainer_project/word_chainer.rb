require "set"

class WordChainer
	ALPHABET = ("a".."z").to_a

	def initialize(filename)
		words = File.readlines(filename).map(&:chomp)	
		@dictionary = Set.new(words)
	end

	def run(source, target)
		raise "source or target word not found in dictory" if !dictionary.include?(source) || !dictionary.include?(target)
		
		@current_words, @all_seen_words = [source], { source => nil }
		
		until @current_words.empty? || @all_seen_words.include?(target)
      explore_current_words
    end

    build_path(target)
	end

	private

	attr_reader :dictionary

	def adjacent_words(word)
		words = []
		word.each_char.with_index do |old_char, i|
			ALPHABET.each do |new_char|
				next if old_char == new_char

				new_word = word[0..-1]
				new_word[i] = new_char
				words << new_word if dictionary.include?(new_word) 
			end
		end

		words
	end

	def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
			# p current_word + " "
      adjacent_words(current_word).each do |adjacent_word|
        next if @all_seen_words.key?(adjacent_word)

        new_current_words << adjacent_word
        @all_seen_words[adjacent_word] = current_word
      end
    end

    @current_words = new_current_words
  end

  def build_path(target)
    path = []
    current_word = target
    until current_word.nil?
      path << current_word
      current_word = @all_seen_words[current_word]
    end

    path.reverse
  end

end

if $PROGRAM_NAME == __FILE__
  # provide file name on command line
	filename, word_one, word_two = ARGV
  p WordChainer.new(filename).run(word_one, word_two)
end