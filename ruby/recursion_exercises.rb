def sum_to(n)
	return nil if n <= 0
	return 1 if n == 1

	n + sum_to(n - 1)
end

# puts sum_to(5)  # => returns 15
# puts sum_to(1)  # => returns 1
# puts sum_to(9)  # => returns 45
# puts sum_to(-8)  # => returns nil

def add_numbers(array)
	return nil if array.length == 0
	return array.first if array.length == 1
	array.first + add_numbers(array[1..-1])
end

# puts add_numbers([1,2,3,4]) # => returns 10
# puts add_numbers([3]) # => returns 3
# puts add_numbers([-80,34,7]) # => returns -39
# puts add_numbers([]) # => returns nil

def gamma_fnc(n)
	return nil if n <= 0
	return 1 if n == 1

	(n - 1) * gamma_fnc(n - 1)

end

# puts gamma_fnc(0)  # => returns nil
# puts gamma_fnc(1)  # => returns 1
# puts gamma_fnc(4)  # => returns 6
# puts gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
	return false if flavors.length == 0
	return true if flavors.first == favorite

	ice_cream_shop(flavors[1..-1], favorite)
end

# puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# puts ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# puts ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
	return string if string.length <= 1
	reverse(string[1..-1]) + string[0]
end

# puts reverse("house") # => "esuoh"
# puts reverse("dog") # => "god"
# puts reverse("atom") # => "mota"
# puts reverse("q") # => "q"
# puts reverse("id") # => "di"
# puts reverse("") # => ""
