require_relative "room"

class Hotel
  def initialize(name, rooms)
		@name = name
		@rooms = {}
		rooms.each do |room_name, capacity|
			@rooms[room_name] = Room.new(capacity)
		end
	end

	def name 
		words = @name.split(" ").map(&:capitalize)
		words.join(" ")
	end

	def rooms
		@rooms
	end

	def room_exists?(name)
		@rooms.has_key?(name)
	end

	def check_in(person_name, room_name)
		if !self.room_exists?(room_name)
			puts "sorry, room does not exist"
		else 
			room = @rooms[room_name]
			if room.add_occupant(person_name)
				puts "check in successful"
			else
				puts "sorry, room is full"
			end
		end
	end

	def has_vacancy?
		@rooms.each do |name, room|
			return true if !room.full?
		end

		false
	end

	def list_rooms
		 @rooms.each { |name, room| puts "#{name} #{room.available_space}" }
	end
end
