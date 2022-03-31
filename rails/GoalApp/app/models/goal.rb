class Goal < ApplicationRecord
	validates :title, presence: true, length: { minimum: 6 }
	validates :title, uniqueness: true
	after_initialize :ensure_defaults

	belongs_to :author, 
		class_name: :User, 
		foreign_key: :user_id

	private 

	def ensure_defaults 
		self.private ||= false
		self.completed ||= false 
	end
end
