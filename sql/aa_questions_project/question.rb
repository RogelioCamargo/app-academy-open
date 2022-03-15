require_relative 'questions_database'

class Question
	attr_accessor :id, :title, :body, :author_id

	def self.find_by_id(question_id)
		question = QuestionsDatabase.instance.execute(<<-SQL, question_id)
			SELECT *
			FROM questions
			WHERE id = ?
		SQL
		p question
		return nil unless question.length > 0

		Question.new(question.first)
	end

	def initialize(options)
		@id = options['id']
		@title = options['title']
		@body = options['body']
		@author_id = options['author_id']
	end
end