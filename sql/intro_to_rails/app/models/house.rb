class House < ApplicationRecord
	validates :address, presence: true
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

