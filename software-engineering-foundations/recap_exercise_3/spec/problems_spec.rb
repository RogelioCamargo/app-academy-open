require "problems"

describe "no_dupes" do
		it "should return a new array containing the elements that were not repeated in the array" do
				expect(no_dupes([1, 1, 2, 1, 3, 2, 4])).to eq([3, 4])
				expect(no_dupes(['x', 'x', 'y', 'z', 'z'])).to eq(['y'])
				expect(no_dupes([true, true, true])).to eq([])
		end
end

describe "no_consecutive_repeats?" do
		it "should return true if an element never appears consecutively in the array; it should return false otherwise" do
				expect(no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])).to eq(true)
				expect(no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])).to eq(false)
				expect(no_consecutive_repeats?([10, 42, 3, 7, 10, 3])).to eq(true)
				expect(no_consecutive_repeats?([10, 42, 3, 3, 10, 3])).to eq(false)
				expect(no_consecutive_repeats?(['x'])).to eq(true)
		end
end

describe "char_indices" do
		it "should return true if an element never appears consecutively in the array; it should return false otherwise" do
				expect(char_indices('mississippi')).to eq({"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]})
				expect(char_indices('classroom')).to eq({"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]})
		end
end

describe "longest_streak" do
		it "should return the longest streak of consecutive characters in the string. If there are any ties, return the streak that occurs later in the string" do
				expect(longest_streak('a')).to eq("a")
				expect(longest_streak('accccbbb')).to eq("cccc")
				expect(longest_streak('aaaxyyyyyzz')).to eq("yyyyy")
				expect(longest_streak('aaabbb')).to eq("bbb")
				expect(longest_streak('abc')).to eq("c")
		end
end

describe "bi_prime?" do
		it "should return a boolean indicating whether or not the number is a bi-prime. A bi-prime is a positive integer that can be obtained by multiplying two prime numbers" do
				expect(bi_prime?(14)).to eq(true)
				expect(bi_prime?(22)).to eq(true)
				expect(bi_prime?(25)).to eq(true)
				expect(bi_prime?(94)).to eq(true)
				expect(bi_prime?(24)).to eq(false)
				expect(bi_prime?(64)).to eq(false)
		end
end

describe "vigenere_cipher" do
		it "should return an encoded message" do
				expect(vigenere_cipher("toerrishuman", [1])).to eq("upfssjtivnbo")
				expect(vigenere_cipher("toerrishuman", [1, 2])).to eq("uqftsktjvobp")
				expect(vigenere_cipher("toerrishuman", [1, 2, 3])).to eq("uqhstltjxncq")
				expect(vigenere_cipher("zebra", [3, 0])).to eq("ceerd")
				expect(vigenere_cipher("yawn", [5, 1])).to eq("dbbo")
		end
end

describe "vowel_rotate" do
		it "should return the string where every vowel is replaced with the vowel that appears before it sequentially in the original string. The first vowel of the string should be replaced with the last vowel" do
				expect(vowel_rotate('computer')).to eq("cempotur")
				expect(vowel_rotate('oranges')).to eq("erongas")
				expect(vowel_rotate('headphones')).to eq("heedphanos")
				expect(vowel_rotate('bootcamp')).to eq("baotcomp")
				expect(vowel_rotate('awesome')).to eq("ewasemo")
		end
end

# describe "" do
# 		it "" do
# 				expect().to eq()
# 				expect().to eq()
# 				expect().to eq()
# 				expect().to eq()
# 				expect().to eq()
# 		end
# end
