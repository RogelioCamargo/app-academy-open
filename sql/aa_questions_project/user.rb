require_relative 'questions_database'

class User
	attr_accessor :id, :fname, :lname
	
	def self.find_by_id(id)
		user = QuestionsDatabase.instance.get_first_row(<<-SQL, id)
			SELECT *
			FROM users
			WHERE id = ?
		SQL
		return nil if user.nil?

		User.new(user)
	end

	def self.find_by_name(fname, lname)
		user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
			SELECT *
			FROM users
			WHERE fname = ? AND lname = ?
		SQL
		User.new(user.first)
	end

	def initialize(options)
		@id = options['id']
		@fname = options['fname']
		@lname = options['lname']
	end
end