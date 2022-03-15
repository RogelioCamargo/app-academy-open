require_relative 'questions_database'
require_relative 'question_follow'
require_relative 'question'
require_relative 'reply'

class User
	attr_reader :id
	attr_accessor :fname, :lname
	
	def self.find_by_id(id)
		user = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT *
			FROM users
			WHERE id = ?
		SQL
		return nil if user.nil?

		User.new(user)
	end

	def self.find_by_name(fname, lname)
		user = QuestionsDatabase.execute(<<-SQL, fname, lname)
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

	def authored_questions
		Question.find_by_author_id(self.id)
	end

	def authored_replies
		Reply.find_by_user_id(self.id)
	end

	def followed_questions
		QuestionFollow.followed_questions_for_user_id(self.id)
	end
end