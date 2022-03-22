class Artwork < ApplicationRecord
	validates :title, :image_url, presence: true
	validates :image_url, uniqueness: true
	validates :title, uniqueness: { scope: :artist_id }

	belongs_to :artist,
		class_name: :User,
		foreign_key: :artist_id,
		primary_key: :id

	has_many :artwork_shares,
		class_name: :ArtworkShare,
		foreign_key: :artwork_id,
		primary_key: :id

	has_many :shared_viewers,
		through: :artwork_shares,
		source: :viewer

	has_many :comments,
		class_name: :Comment,
		foreign_key: :artwork_id,
		primary_key: :id,
		dependent: :destroy

	def self.artworks_for_user_id(user_id)
		Artwork
			.left_outer_joins(:artwork_shares)
			.where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
			.distinct
	end
end