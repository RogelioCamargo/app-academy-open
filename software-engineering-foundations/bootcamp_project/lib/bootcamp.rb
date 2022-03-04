class Bootcamp
  def initialize(name, slogan, student_capacity)
		@name = name
		@slogan = slogan
		@student_capacity = student_capacity
		@teachers = []
		@students = []
		@grades = Hash.new { |hash, key| hash[key] = [] }
	end

	def name
		@name
	end

	def slogan
		@slogan
	end

	def teachers
		@teachers
	end

	def students
		@students
	end

	def hire(name)
		@teachers << name
	end

	def enroll(name)
		if @students.length < @student_capacity 
			@students << name
			true
		else
			false
		end
	end

	def enrolled?(name)
		@students.include?(name)
	end

	def student_to_teacher_ratio
		@students.length / @teachers.length
	end

	def add_grade(name, grade)
		if self.enrolled?(name)
			@grades[name] << grade
			return true
		end
		
		false
	end

	def num_grades(name)
		@grades[name].length
	end

	def average_grade(name)
		if self.enrolled?(name)
			grades = @grades[name]
			return nil if grades.length == 0
			grades.sum / grades.length
		end
	end
end
