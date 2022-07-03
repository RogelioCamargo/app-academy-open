class Track < ApplicationRecord
	validates :name, :ord, presence: true 
	validates :ord, uniqueness: { scope: :album_id }
	validates :bonus, inclusion: { in: [true, false] }
	after_initialize :set_defaults 

	belongs_to :album 

	private 

	def set_defaults 
		self.bonus ||= false
	end
end
