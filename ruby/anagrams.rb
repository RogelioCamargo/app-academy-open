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
def anagram?(str_1, str_2)
	perms = my_permutations(str_1)
	perms.each do |perm|
		return true if perm == str_2
	end
	false
end


p anagram?("elvis", "lives")    #=> true
p anagram?("gizmo", "sally")    #=> false

# p my_permutations("abc").length		#=> ["abc", "bac", "bca", "acb", "cab", "cba"]