require 'action_view'

class Cat < ApplicationRecord
	include ActionView::Helpers::DateHelper

	CAT_COLORS = %w(white black orange).freeze

	validates :birth_date, :color, :name, :sex, presence: true 
	validates :color, inclusion: CAT_COLORS
	validates :sex, inclusion: %w(M F)

	has_many :cat_rental_requests,
		class_name: :CatRentalRequest,
		foreign_key: :cat_id, 
		primary_key: :id,
		dependent: :destroy

	def age 
		time_ago_in_words(birth_date)
	end
end
