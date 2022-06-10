class House < ApplicationRecord 
	validates :address, presence: true 
end