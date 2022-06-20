class ArtworkShare < ApplicationRecord
	validates :artwork_id, uniqueness: { scope: :viewer_id }
	validates :favorite, inclusion: { in: [true, false] }

	belongs_to :viewer, 
		class_name: :User 

	belongs_to :artwork
end
