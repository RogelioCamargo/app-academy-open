require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class Reply
	attr_reader :id
	attr_accessor :question_id, :parent_reply_id, :author_id, :body

	def self.find(reply_id)
		reply = QuestionsDatabase.get_first_row(<<-SQL, reply_id)
			SELECT *
			FROM replies
			WHERE id = ?
		SQL
		return nil if reply.nil?

		Reply.new(reply)
	end

	def self.find_by_parent_id(parent_id)
		child_replies = QuestionsDatabase.execute(<<-SQL, parent_id)
			SELECT *
			FROM replies
			WHERE parent_reply_id = ?
		SQL
		return nil if child_replies.nil?

		child_replies.map { |child_reply| Reply.new(child_reply) }
	end

	def self.find_by_user_id(user_id)
		replies = QuestionsDatabase.execute(<<-SQL, user_id)
			SELECT *
			FROM replies
			WHERE author_id = ?
		SQL
		return nil unless replies.length > 0

		replies.map { |reply| Reply.new(reply) }
	end

	def self.find_by_question_id(question_id)
		replies = QuestionsDatabase.execute(<<-SQL, question_id)
			SELECT *
			FROM replies
			WHERE question_id = ?
		SQL
		return nil unless replies.length > 0

		replies.map { |reply| Reply.new(reply) }
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
		Question.find(self.question_id)
	end

	def parent_reply
		Reply.find(self.parent_reply_id)
	end

	def child_replies
		Reply.find_by_parent_id(self.id)
	end

	def save
		if @id.nil?
			QuestionsDatabase.execute(<<-SQL, self.question_id, self.parent_reply_id, self.author_id, self.body)
				INSERT INTO replies (question_id, parent_reply_id, author_id, body)
				VALUES (?, ?, ?, ?)
			SQL
			@id = QuestionsDatabase.last_insert_row_id
		else
			QuestionsDatabase.execute(<<-SQL, self.question_id, self.parent_reply_id, self.author_id, self.body, self.id)
				UPDATE replies
				SET question_id = ?, parent_reply_id = ?, author_id = ?, body = ?
				WHERE id = ?
			SQL
		end
		self
	end
end