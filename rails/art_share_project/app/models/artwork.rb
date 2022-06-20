class Artwork < ApplicationRecord
	validates :title, :image_url, presence: true 
	validates :image_url, uniqueness: true 
	validates :title, uniqueness: { scope: :artist_id }

	belongs_to :artist, 
		foreign_key: :artist_id, 
		class_name: :User 

	has_many :artwork_shares,
		dependent: :destroy

	has_many :shared_viewers, 
		through: :artwork_shares,
		source: :viewer

	def self.artworks_for_user_id(user_id)
		Artwork
			.left_outer_joins(:artwork_shares)
			.where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
			.distinct
	end
end
