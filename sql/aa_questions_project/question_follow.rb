require_relative 'questions_database'

class QuestionFollow
	attr_accessor :id, :question_id, :user_id
	
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