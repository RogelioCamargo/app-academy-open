class Employee 
	attr_reader :name, :title, :salary, :boss
	def initialize(name, salary, title, boss = nil)
		@name = name 
		@title = title 
		@salary = salary
		self.boss = boss
	end

	def boss=(boss)
		return nil if boss.nil? 
		@boss = boss 
		boss.add_employee(self)
	end

	def bonus(multiplier)
		salary * multiplier
	end
end

class Manager < Employee
	attr_reader :employees
	def initialize(name, salary, title, boss = nil)
		super(name, salary, title, boss)
		@employees = []
	end

	def add_employee(employee)
		employees << employee
	end

	def bonus(multiplier)
		self.total_subsalary * multiplier
	end

	protected

	def total_subsalary 
		total_salary = 0
		employees.each do |employee|
			if employee.is_a?(self.class)
				total_salary += employee.salary + employee.total_subsalary
			else 
				total_salary += employee.salary
			end
		end
		total_salary
	end
end

shawna = Employee.new("Shawna", 12000, "TA")
david = Employee.new("David",	10000, "TA")
darren = Manager.new("Darren", 78000, "TA Manager")
ned = Manager.new("Ned", 1000000, "Founder", nil)
shawna.boss = darren 
david.boss = darren 
darren.boss = ned 

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
