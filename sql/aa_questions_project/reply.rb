require_relative 'questions_database'
require_relative "user"
require_relative "question"

class Reply
	attr_reader :id
	attr_accessor :question_id, :parent_reply_id, :author_id, :body 

	def self.find_by_id(id)
		reply_data = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT * FROM replies WHERE id = ? 
		SQL

		Reply.new(reply_data)
	end

	def self.find_by_user_id(user_id)
		user_replies_data = QuestionsDatabase.execute(<<-SQL, user_id)
			SELECT * FROM replies WHERE author_id = ? 
		SQL

		user_replies_data.map { |reply_data| Reply.new(reply_data) }
	end

	def self.find_by_question_id(question_id)
		question_replies_data =  QuestionsDatabase.execute(<<-SQL, question_id)
			SELECT * FROM replies WHERE question_id = ? 
		SQL

		question_replies_data.map { |reply_data| Reply.new(reply_data) }
	end

	def initialize(options)
		@id = options['id']
		@question_id = options['question_id']
		@parent_reply_id = options['parent_reply_id']
		@author_id = options['author_id']
		@body = options['body']
	end

	def author 
		User.find_by_id(self.author_id)
	end

	def question 
		Question.find_by_id(self.question_id)
	end

	def parent_reply 
		Reply.find_by_id(self.parent_reply_id)
	end

	def child_replies
		child_replies_data = QuestionsDatabase.execute(<<-SQL, self.id)
			SELECT * FROM replies 
			WHERE parent_reply_id = ? 
		SQL

		child_replies_data.map { |reply_data| Reply.new(reply_data) }
	end
end