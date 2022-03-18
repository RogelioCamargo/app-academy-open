require 'securerandom'

class ShortenUrl < ApplicationRecord
	validates :short_url, :long_url, :submitter_id, presence: true
	validates :short_url, uniqueness: true

	belongs_to :submitter, 
		class_name: :User,
		foreign_key: :submitter_id,
		primary_key: :id

	has_many :visits,
		class_name: :Visit,
		foreign_key: :shorten_url,
		primary_key: :id

	has_many :visitors,
		through: :visits,
		source: :visitor

	def self.random_code 	
		loop do 
			random_code = SecureRandom.urlsafe_base64
			return random_code unless ShortenUrl.exists?(short_url: random_code)
		end
	end

	def self.generate_shorten_url(user, long_url)
		ShortenUrl.create!(
			short_url: ShortenUrl.random_code,
			long_url: long_url,
			submitter_id: user.id
		)
	end
end