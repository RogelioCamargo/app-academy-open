class Tagging < ApplicationRecord
	validates :shorten_url_id, uniqueness: { scope: :tag_topic_id }

	belongs_to :shorten_url,
		class_name: :ShortenUrl,
		foreign_key: :shorten_url_id,
		primary_key: :id

	belongs_to :tag_toic,
		class_name: :TagTopic,
		foreign_key: :tag_topic_id,
		primary_key: :id
end
# == Schema Information
#
# Table name: taggings
#
#  id             :integer(8)      not null, primary key
#  tag_topic_id   :integer(4)      not null
#  shorten_url_id :integer(4)      not null
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

