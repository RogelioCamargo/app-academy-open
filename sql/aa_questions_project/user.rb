require_relative 'questions_database'

class User
	attr_reader :id 
	attr_accessor :fname, :lname
	
	def self.find_by_id(id)
		user_data = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT * FROM users WHERE id = ? 
		SQL

		User.new(user_data)
	end

	def initialize(options)
		@id = options['id']
		@fname = options['fname']
		@lname = options['lname']
	end
end