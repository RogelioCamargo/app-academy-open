class Person 
	def initialize(name)
		@name = name 
	end

	# def call_protected_method 
	# 	self.protected_method_here
	# end

	def call_private_method
		puts self.private_method_here(1, 1)
	end

	private 
	def private_method_here(a, b) 
		a + b
	end

	# protected 
	# def protected_method_here 
	# 	puts "this is a protected method"
	# end
end

class AnotherPerson < Person 
	def initialize(name)
		super
	end
end

p = Person.new("Roger")
# p.call_protected_method
p.call_private_method

ap = AnotherPerson.new("Emma")
# ap.call_protected_method
ap.call_private_method
