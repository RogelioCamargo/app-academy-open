def factors(num)
	(1..num).select { |i| num % i == 0 }
end

def substrings(string)
	substrings = []
	(0...string.length).each do |start_index|
		(start_index...string.length).each do |end_index|
			substrings << string[start_index..end_index]
		end
	end
	substrings
end

def subwords(word, subwords)
	substrings = substrings(word)
	subwords.select { |subword| substrings.include?(subword) }
end

class Array 
	def bubble_sort(&prc)
		new_array = self[0..-1]
		new_array.bubble_sort!(&prc)
	end

	def bubble_sort!(&prc)
		prc ||= Proc.new { |a, b| a <=> b }
		sorted = false 
		until sorted do 
			sorted = true 
			(0...self.length - 1).each do |i|
				if prc.call(self[i], self[i + 1]) == 1
					self[i], self[i + 1] = self[i + 1], self[i]
					sorted = false
				end
			end
		end
		self 
	end
end