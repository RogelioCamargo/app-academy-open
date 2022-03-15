require_relative 'questions_database'
require_relative 'user'
require_relative 'reply'

class Question
	attr_reader :id
	attr_accessor :title, :body, :author_id

	def self.find_by_id(question_id)
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
end