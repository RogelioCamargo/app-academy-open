class Question < ApplicationRecord
	validates :text, presence: true

	has_many :answer_choices, 
		primary_key: :id, 
		foreign_key: :question_id, 
		class_name: :AnswerChoice

	belongs_to :poll, 
		primary_key: :id, 
		foreign_key: :poll_id, 
		class_name: :Poll

	has_many :responses, 
		through: :answer_choices,
		source: :responses

	def results 
		answer_choice_counts = self.answer_choices
			.select('answer_choices.text, COUNT(responses.id) AS votes')
			.left_outer_joins(:responses)
			.group('answer_choices.id')

		results = {} 
		answer_choice_counts.each { |object| results[object.text] = object.votes }
		results
	end
	
end