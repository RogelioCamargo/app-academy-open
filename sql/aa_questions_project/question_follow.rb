require_relative 'questions_database'

class QuestionFollow
	attr_reader :id 
	attr_accessor :user_id, :question_id
	
	def self.find_by_id(id)
		question_follow_data = QuestionsDatabase.get_first_row(<<-SQL, id)
			SELECT * FROM question_follows WHERE id = ? 
		SQL

		QuestionFollow.new(question_follow_data)
	end

	def initialize(options)
		@id = options['id']
		@user_id = options['user_id']
		@question_id = options['question_id']
	end
end