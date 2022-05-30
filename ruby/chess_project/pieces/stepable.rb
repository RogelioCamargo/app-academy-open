module Stepable 
	def moves 
		moves = []
		x, y = position
		all_possible_moves.each do |dx, dy|
			new_position = [x + dx, y + dy]
			next unless board.valid_position?(new_position)

			if board.empty?(new_position)
				moves << new_position
			elsif board[new_position].color != color 
				moves << new_position 
			end
		end
		moves
	end 

	private 

	def all_possible_moves  
		raise NotImplementedError
	end
end