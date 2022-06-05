def is_prime?(num)
	return false if num < 2 

	(2...num).each do |factor|
		return false if num % factor == 0
	end

	true
end

def nth_prime(num)
	return nil if num <= 0

	nth = num
	i = 2 
	while nth != 0
		nth -= 1 if is_prime?(i)
		i += 1
	end

	i - 1
end

def prime_range(min, max)
	primes = []
	(min..max).each do |num|
		primes << num if is_prime?(num)
	end
	primes
end 