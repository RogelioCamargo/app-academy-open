class Track < ApplicationRecord
	validates :name, :ord, presence: true 
	validates :ord, uniqueness: { scope: :album_id }
	validates :bonus, inclusion: { in: [true, false] }
	after_initialize :set_defaults 

	belongs_to :album 

	has_one :band, 
		through: :album, 
		source: :band

	private 

	def set_defaults 
		self.bonus ||= false
	end
end
