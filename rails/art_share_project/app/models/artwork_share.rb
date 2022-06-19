class ArtworkShare < ApplicationRecord
	validates :artwork_id, uniquessness: { scope: :viewer_id }

	belongs_to :viewer, 
		class_name: :User 

	belongs_to :artwork
end
