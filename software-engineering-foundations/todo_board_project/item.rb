class Item 
	attr_accessor :title, :deadline, :description

	def self.valid_date?(date_string)
		# check length
		return false if date_string.length != 10

		year, month, day = date_string.split("-")
		# check nils
		return false if !year || !month || !day
		# check ranges
		return false if year.length != 4 || !(1..12).include?(month.to_i) || !(1..31).include?(day.to_i)

		true 
	end

	def initialize(title, deadline, description)
		raise "Invalid Date" if !Item.valid_date?(deadline)

		@title = title
		@deadline = deadline
		@description = description
	end


end