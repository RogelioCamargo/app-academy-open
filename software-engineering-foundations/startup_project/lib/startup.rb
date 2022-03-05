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
		if valid_title?(title)
			new_employee = Employee.new(employee_name, title)
			@employees << new_employee
		else 
			raise "title is invalid"
		end
	end

	def size
		@employees.length
	end

	def pay_employee(employee)
		salary = @salaries[employee.title]
		if salary < @funding
			employee.pay(salary)
			@funding -= salary
		else 
			raise "not enough money"
		end
	end

	def payday
		@employees.each { |employee| self.pay_employee(employee) }
	end

	def average_salary
		employee_salaries = @employees.map { |employee| @salaries[employee.title] }
		employee_salaries.sum / employee_salaries.length
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

		startup.employees.each do |employee|
			@employees << employee
		end

		startup.close
	end
end
