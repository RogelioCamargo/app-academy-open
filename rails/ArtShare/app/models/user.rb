class User < ApplicationRecord
	validates :username, presence: true, uniqueness: true

	has_many :artworks,
		class_name: :Artwork,
		foreign_key: :artist_id,
		primary_key: id,
		dependent: :destory
end