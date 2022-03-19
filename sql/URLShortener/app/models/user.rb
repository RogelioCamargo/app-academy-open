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


# == Schema Information
#
# Table name: users
#
#  id         :integer(8)      not null, primary key
#  email      :string          not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  premium    :boolean
#

