class User < ApplicationRecord
	validates :email, presence: true, uniqueness: true

	has_many :submitted_urls,
		class_name: :ShortenUrl,
		foreign_key: :submitter_id,
		primary_key: :id
end