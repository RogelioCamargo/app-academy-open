require "employee"

class Startup
	attr_reader :name, :funding, :salaries, :employees

	def initialize(name, funding, salaries)
		@name = name 
		@funding = funding
		@salaries = salaries
		@employees = []
	end

	def valid_title?(title)
		@salaries.has_key?(title)
	end

	def >(startup)
		self.funding > startup.funding
	end

	def hire(employee_name, title)
		if !valid_title?(title)
			raise "not valid title"
			return 
		end

		@employees << Employee.new(employee_name, title)
	end

	def size
		@employees.length 
	end

	def pay_employee(employee)
		payment_amount = @salaries[employee.title]
		if @funding >= payment_amount
			employee.pay(payment_amount)
			@funding -= payment_amount
		else
			raise "Not enough funding"
		end
	end

	def payday
		@employees.each do |employee|
			pay_employee(employee)
		end
	end

	def average_salary
		sum = 0
		employees.each do |employee|
			sum += salaries[employee.title]
		end
		sum / (employees.length * 1.0)
	end

	def close 
		@employees = []
		@funding = 0
	end

	def acquire(startup)
		@funding += startup.funding 
		startup.salaries.each do |title, salary|
			if !@salaries.has_key?(title)
				@salaries[title] = salary
			end
		end

		@employees += startup.employees
		startup.close
	end
end
