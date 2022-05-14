# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(number)
	div = number
	while div >= 2 do
		return div if number % div == 0 && is_prime?(div)
		div -= 1
	end
end

def is_prime?(number) 
	(2...number).each do |value|
		return false if number % value == 0
	end

	true
end