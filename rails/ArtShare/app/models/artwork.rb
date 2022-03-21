class Artwork < ApplicationRecord
	validates :title, :image_url, presence: true
	validates :image_url, uniqueness: true
	validates :title, scope: { :artist_id }

	belongs_to :artist,
		class_name: :User,
		foreign_key: :artist_id,
		primary_key: :id
end