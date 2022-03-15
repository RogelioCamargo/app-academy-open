require_relative 'questions_database'

class Reply
	attr_accessor :id, :question_id, :parent_reply_id, :author_id, :body

	def self.find_by_id(reply_id)
		reply = QuestionsDatabase.get_first_row(<<-SQL, reply_id)
			SELECT *
			FROM replies
			WHERE id = ?
		SQL
		return nil if reply.nil?

		Reply.new(reply)
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
end