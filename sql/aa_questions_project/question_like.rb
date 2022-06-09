require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class QuestionLike
	attr_reader :id 
	attr_accessor :user_id, :question_id
	
	def self.find_by_id(id)
		question_like_data = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT * FROM question_likes WHERE id = ? 
		SQL

		QuestionLike.new(question_like_data)
	end

	def self.likers_for_question_id(question_id)
		users_data = QuestionsDatabase.execute(<<-SQL, question_id)
			SELECT users.* FROM users
			JOIN (
				SELECT * FROM question_likes 
				WHERE question_likes.question_id = ? 
			) AS specific_question_likes 
			ON specific_question_likes.user_id = users.id
		SQL

		users_data.map { |user_data| User.new(user_data)}
	end

	def self.num_likes_for_question_id(question_id)
		QuestionsDatabase.get_first_value(<<-SQL, question_id)
			SELECT COUNT(*) FROM question_likes 
			WHERE question_id = ? 
		SQL
	end

	def self.liked_questions_for_user_id(user_id)
		questions_data = QuestionsDatabase.execute(<<-SQL, user_id)
			SELECT questions.* FROM questions
			JOIN (
				SELECT * FROM question_likes 
				WHERE question_likes.user_id = ? 
			) AS specific_question_likes 
			ON specific_question_likes.question_id = questions.id
		SQL

		questions_data.map { |question_data| Question.new(question_data) }
	end

	def self.most_liked_questions(n)
		questions_data = QuestionsDatabase.execute(<<-SQL, n)
			SELECT questions.* FROM questions 
			JOIN question_likes ON question_likes.question_id = questions.id 
			GROUP BY questions.id 
			ORDER BY COUNT(questions.id) DESC 
			LIMIT ?
		SQL

		questions_data.map { |question_data| Question.new(question_data) }
	end

	def initialize(options)
		@id = options['id']
		@user_id = options['user_id']
		@question_id = options['question_id']
	end
end