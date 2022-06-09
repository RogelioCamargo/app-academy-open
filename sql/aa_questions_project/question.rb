require_relative 'questions_database'

class Question 
	attr_reader :id 
	attr_accessor :title, :body, :author_id

	def self.find_by_id(id)
		question_data = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT * FROM questions WHERE id = ? 
		SQL

		Question.new(question_data)
	end

	def initialize(options)
		@id = options['id']
		@title = options['title']
		@body = options['body']
		@author_id = options['author_id']
	end
end