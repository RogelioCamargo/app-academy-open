require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class QuestionLike
	attr_accessor :id, :question_id, :user_id

	def self.likers_for_question_id(question_id)
		users_data = QuestionsDatabase.execute(<<-SQL, question_id)
			SELECT users.*
			FROM users
			JOIN question_likes
			ON question_likes.user_id = users.id
			WHERE question_likes.question_id = ?
		SQL
		return nil unless users_data.length > 0

		users_data.map { |user| User.new(user) }
	end

	def self.num_likes_for_question_id(question_id)
		QuestionsDatabase.get_first_value(<<-SQL, question_id)
			SELECT COUNT(*)
			FROM question_likes
			WHERE question_likes.question_id = ?
		SQL
	end

	def self.liked_questions_for_user_id(user_id)
		questions_data = QuestionsDatabase.execute(<<-SQL, user_id)
			SELECT questions.*
			FROM questions
			JOIN question_likes
			ON question_likes.question_id = questions.id
			WHERE question_likes.user_id = ?
		SQL
		return nil unless questions_data.length > 0

		questions_data.map { |question| Question.new(question) }
	end
	
	def self.most_liked_questions(n)
		questions_data = QuestionsDatabase.execute(<<-SQL, n)
			SELECT questions.*
			FROM questions
			JOIN question_likes
			ON question_likes.question_id = questions.id
			GROUP BY questions.id
			ORDER BY COUNT(*) DESC
			LIMIT ?
		SQL
		return nil unless questions_data.length > 0

		questions_data.map { |question| Question.new(question) }
	end
	
	def self.find_by_id(id)
		question_like = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT *
			FROM question_likes
			WHERE id = ?
		SQL
		return nil if question_like.nil?

		QuestionLike.new(question_like)
	end

	def initialize(options)
		@id = options['id']
		@question_id = options['question_id']
		@user_id = options['user_id']
	end
end