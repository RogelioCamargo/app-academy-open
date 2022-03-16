require_relative 'questions_database'
require_relative 'question_follow'
require_relative 'question_like'
require_relative 'user'
require_relative 'reply'

class Question
	attr_reader :id
	attr_accessor :title, :body, :author_id

	def self.most_liked(n)
		QuestionLike.most_liked_questions(n)
	end

	def self.most_followed(n)
		QuestionFollow.most_followed_questions(n)
	end

	def self.find(question_id)
		question = QuestionsDatabase.get_first_row(<<-SQL, question_id)
			SELECT *
			FROM questions
			WHERE id = ?
		SQL
		return nil if question.nil?

		Question.new(question)
	end

	def self.find_by_author_id(author_id)
		questions = QuestionsDatabase.execute(<<-SQL, author_id)
			SELECT *
			FROM questions
			WHERE author_id = ?
		SQL
		return nil unless questions.length > 0

		questions.map { |question| Question.new(question) }
	end

	def initialize(options)
		@id = options['id']
		@title = options['title']
		@body = options['body']
		@author_id = options['author_id']
	end

	def author
		User.find_by_id(self.author_id)
	end

	def replies
		Reply.find_by_question_id(self.author_id)
	end

	def followers
		QuestionFollow.followers_for_question_id(self.id)
	end

	def likers
		QuestionLike.likers_for_question_id(self.id)
	end

	def num_likes
		QuestionLike.num_likes_for_question_id(self.id)
	end

	def save
		if @id.nil?
			QuestionsDatabase.execute(<<-SQL, self.title, self.body, self.author_id)
				INSERT INTO questions (title, body, author_id)
				VALUES (?, ?, ?)
			SQL
			@id = QuestionsDatabase.last_insert_row_id
		else
			QuestionsDatabase.execute(<<-SQL, self.title, self.body, self.author_id, self.id)
				UPDATE questions
				SET title = ?, body = ?, author_id = ?
				WHERE id = ?
			SQL
		end
		self
	end
end