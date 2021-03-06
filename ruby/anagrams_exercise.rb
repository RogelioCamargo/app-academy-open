def my_permutations(string)
	return [string] if string.length <= 1
	perms = []
	first_char = string[0] 
	perms_without_first = my_permutations(string[1..-1])
	perms_without_first.each do |perm|
		(perm.length + 1).times do |idx|
			perms << (perm[0...idx] + first_char + perm[idx..-1])
		end
	end
	perms 
end

# O(n!)
# def anagram?(str_1, str_2)
# 	perms = my_permutations(str_1)
# 	perms.each do |perm|
# 		return true if perm == str_2
# 	end
# 	false
# end

# O(n^2)
# def anagram?(str_1, str_2)
# 	str2_array = str_2.split("")
# 	str_1.each_char do |ch|
# 		idx = str2_array.find_index(ch)
# 		return false if idx.nil?  
# 		p str2_array
# 		str2_array.delete_at(idx)
# 	end
# 	str2_array.empty? ? true : false
# end

# O(nlogn)
# def anagram?(str_1, str_2)
# 	str1_sorted = str_1.split("").sort
# 	str2_sorted = str_2.split("").sort 
# 	str1_sorted == str2_sorted
# end

def anagram?(str_1, str_2)
	counts = Hash.new(0)
	str_1.each_char do |ch|
		counts[ch] += 1
	end
	str_2.each_char do |ch|
		counts[ch] -= 1
	end

	counts.each do |k, v|
		return false if v != 0 
	end
	true
end

p anagram?("elvis", "lives")    #=> true
p anagram?("gizmo", "sally")    #=> false

# p my_permutations("abc").length		#=> ["abc", "bac", "bca", "acb", "cab", "cba"]