class Artwork < ApplicationRecord
	validates :title, :image_url, presence: true 
	validates :image_url, uniquess: true 
	validates :title, uniqueness: { scope: :artist_id }

	belongs_to :artist, 
		foreign_key: :artist_id, 
		class_name: :User 
end
