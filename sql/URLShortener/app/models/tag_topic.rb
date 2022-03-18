class TagTopic < ApplicationRecord
	validates :name, presence: true

	has_many :taggings,
		class_name: :Tagging,
		foreign_key: :tag_topic_id,
		primary_key: :id

	has_many :shorten_urls,
		through: :taggings,
		source: :shorten_url

	def popular_links
		shorten_urls
			.joins(:visits)
			.group(:short_url, :long_url)
			.order('COUNT(visits.id) DESC')
			.select('long_url, short_url, COUNT(visits.id) AS number_of_exits')
			.limit(5)
	end
end
# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer(8)      not null, primary key
#  name       :string          not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

