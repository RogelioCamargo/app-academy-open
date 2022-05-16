class Player
	def get_move 
		puts "enter a position with coordinates separated with a space like `4 7`"
		guess_position = gets.chomp 
		row, col = guess_position.split(" ")
		[row.to_i, col.to_i]
	end
end
