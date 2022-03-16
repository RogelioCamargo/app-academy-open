require_relative 'questions_database'
require_relative 'question'
require_relative 'user'

class QuestionFollow
	attr_reader :id
	attr_accessor :question_id, :user_id

	def self.followers_for_question_id(question_id)
		users_data = QuestionsDatabase.execute(<<-SQL, question_id)
			SELECT users.*
			FROM users
			JOIN question_follows
			ON question_follows.user_id = users.id
			WHERE question_follows.question_id = ?
		SQL
		return nil unless users_data.length > 0

		users_data.map { |user| User.new(user) }
	end

	def self.followed_questions_for_user_id(user_id)
		questions_data = QuestionsDatabase.execute(<<-SQL, user_id)
			SELECT questions.*
			FROM questions
			JOIN question_follows
			ON question_follows.question_id = questions.id
			WHERE question_follows.user_id = ?
		SQL
		return nil unless questions_data.length > 0

		questions_data.map { |question| Question.new(question) }
	end

	def self.most_followed_questions(n)
		questions = QuestionsDatabase.execute(<<-SQL, n)
			SELECT questions.*
			FROM questions
			JOIN question_follows
			ON question_follows.question_id = questions.id
			GROUP BY question_follows.question_id
			ORDER BY COUNT(*) DESC
			LIMIT ?
		SQL
		return nil unless questions.length > 0

		questions.map { |question| Question.new(question) }
	end
	
	def self.find_by_id(id)
		question_folow = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT *
			FROM question_folows
			WHERE id = ?
		SQL
		return nil if question_folow.nil?

		QuestionLike.new(question_folow)
	end

	def initialize(options)
		@id = options['id']
		@question_id = options['question_id']
		@user_id = options['user_id']
	end
end