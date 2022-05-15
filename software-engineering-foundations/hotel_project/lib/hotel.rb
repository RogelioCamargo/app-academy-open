require_relative "room"

class Hotel
  def initialize(name, capacities)
		@name = name
		rooms = Hash.new
		capacities.each do |key, value|
			rooms[key] = Room.new(value)
		end
		@rooms = rooms
	end

	def name 
		words = @name.split(" ").map { |word| word.capitalize }
		words.join(" ")
	end

	def rooms 
		@rooms 
	end

	def room_exists?(room_name)
		@rooms.has_key?(room_name)
	end

	def check_in(person_name, room_name)
		if !room_exists?(room_name)
			puts 'sorry, room does not exist'
			return 
		end

		room = @rooms[room_name]
		if room.add_occupant(person_name)
			puts 'check in successful'
		else
			puts 'sorry, room is full'
		end
	end

	def has_vacancy?
		@rooms.each do |room_name, room_instance|
			return true if !room_instance.full?
		end
		false
	end

	def list_rooms 
		@rooms.each do |room_name, room_instance|
			puts "#{room_name} : #{room_instance.available_space}"
		end
	end
end
