class Player
	def get_move
		puts "enter a position with coordinates seperated with a space with `4 7`"
		move = gets.chomp
		move.split(" ").map(&:to_i)
	end
end
