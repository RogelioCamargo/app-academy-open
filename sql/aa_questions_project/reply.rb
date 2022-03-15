require_relative 'questions_database'

class Reply
	attr_accessor :id, :question_id, :parent_reply_id, :author_id, :body

	def self.find_by_id(id)
		reply = QuestionsDatabase.instance.execute(<<-SQL, id)
			SELECT *
			FROM replies
			WHERE id = ?
		SQL

		Reply.new(reply.first)
	end

	def initialize(options)
		@id = options['id']
		@question_id = options['question_id']
		@parent_reply_id = options['parent_reply_id']
		@author_id = options['author_id']
		@body = options['body']
	end
end