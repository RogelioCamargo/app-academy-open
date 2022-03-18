class Visit < ApplicationRecord
	validates :visitor_id, presence: true
	validates :shorten_url_id, presence: true

	belongs_to :visitor,
		class_name: :User,
		foreign_key: :visitor_id,
		primary_key: :id

	belongs_to :shorten_url,
		class_name: :ShortenUrl,
		foreign_key: :shorten_url_id,
		primary_key: :id

	def self.record_visit!(user, shorten_url)
		Visit.create!(
			visitor_id: user.id,
			shorten_url_id: shorten_url.id
		)
	end
end