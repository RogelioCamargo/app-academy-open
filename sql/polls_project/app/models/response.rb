class Response < ApplicationRecord
	belongs_to :answer_choice,
		primary_key: :id, 
		foreign_key: :answer_choice_id, 
		class_name: :AnswerChoice

	belongs_to :respondent,
		primary_key: :id, 
		foreign_key: :respondent_id, 
		class_name: :User

	has_one :question, 
		through: :answer_choice, 
		source: :question

	validate :not_duplicate_response

	def sibling_responses
		self.question.responses.where.not(id: self.id)
	end

	def respondent_already_answered?
		sibling_responses.exists?(respondent_id: self.respondent_id)
	end

	private 

	def not_duplicate_response
		if respondent_already_answered? 
			errors.add(:respondent_id, 'cannot answer the same question twice')
		end
	end 
end