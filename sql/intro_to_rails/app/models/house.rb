class House < ApplicationRecord
	validates :address, presence: true

	has_many :residents,
		class_name: :Person,
		foreign_key: :house_id,
		primary_key: :id
end
# == Schema Information
#
# Table name: houses
#
#  id         :integer(8)      not null, primary key
#  address    :string          not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

