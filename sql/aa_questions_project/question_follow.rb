require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class QuestionFollow
	attr_reader :id 
	attr_accessor :user_id, :question_id
	
	def self.find_by_id(id)
		question_follow_data = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT * FROM question_follows WHERE id = ? 
		SQL

		QuestionFollow.new(question_follow_data)
	end

	def self.followers_for_question_id(question_id)
		users_data = QuestionsDatabase.execute(<<-SQL, question_id)
			SELECT users.* FROM users
			JOIN question_follows ON question_follows.user_id = users.id
			WHERE question_follows.question_id = ? 
		SQL

		users_data.map { |user_data| User.new(user_data) }
	end

	def self.followed_questions_for_user_id(user_id)
		questions_data = QuestionsDatabase.execute(<<-SQL, user_id)
			SELECT questions.* FROM questions
			JOIN question_follows ON question_follows.question_id = questions.id 
			WHERE question_follows.user_id = ?
		SQL

		questions_data.map { |question_data| Question.new(question_data) }
	end

	def initialize(options)
		@id = options['id']
		@user_id = options['user_id']
		@question_id = options['question_id']
	end
end