# == Schema Information
#
# Table name: shorten_urls
#
#  id           :integer(8)      not null, primary key
#  short_url    :string          not null
#  long_url     :string          not null
#  submitter_id :integer(4)      not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#
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
		-> { distinct },
		through: :visits,
		source: :visitor

	def self.random_code 	
		loop do 
			random_code = SecureRandom.urlsafe_base64
			return random_code unless ShortenUrl.exists?(short_url: random_code)
		end
	end

	def self.generate_shorten_url!(user, long_url)
		ShortenUrl.create!(
			short_url: ShortenUrl.random_code,
			long_url: long_url,
			submitter_id: user.id
		)
	end

	def num_clicks
		visits.count
	end

	def num_uniques
		# visits.select(:visitor_id).distinct.count
		visitors.count
	end

	def num_recent_uniques
		# visits
		# 	.select(:visitor_id)
		# 	.where('created_at > ?', 10.minutes.ago)
		# 	.distinct
		# 	.count

		visitors.where('visits.created_at > ?', 10.minutes.ago).count
	end
end

