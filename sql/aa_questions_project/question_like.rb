require_relative 'questions_database'

class QuestionLike
	attr_accessor :id, :question_id, :user_id
	
	def self.find_by_id(id)
		question_like = QuestionsDatabase.instance.get_first_row(<<-SQL, id)
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