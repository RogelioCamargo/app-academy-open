class User < ApplicationRecord
	validates :email, presence: true, uniqueness: true

	has_many :submitted_urls,
		class_name: :ShortenUrl,
		foreign_key: :submitter_id,
		primary_key: :id

	has_many :visits,
		class_name: :Visit,
		foreign_key: :visitor_id,
		primary_key: :id

	has_many :visited_urls, 
		-> { distinct },
		through: :visits,
		source: :shorten_url
end