module Slideable
	def horizontal_and_vertical_directions 
		HORIZONTAL_AND_VERTICAL_DIRECTIONS
	end

	def diagonal_directions 
		DIAGONAL_DIRECTIONS
	end

	def moves 
		moves = []
		move_directions.each do |dx, dy|
			moves.concat(grow_unblocked_moves_in_direction(dx, dy))
		end
		moves
	end

	private 

	HORIZONTAL_AND_VERTICAL_DIRECTIONS = [[1,0], [0,1], [-1,0], [0,-1]].freeze
	DIAGONAL_DIRECTIONS = [[1,1], [1,-1], [-1,1], [-1, -1]].freeze 

	def move_directions 
		raise NotImplementedError
	end 

	def grow_unblocked_moves_in_direction(dx, dy)
		moves = []
		current_x, current_y = position 
		loop do 
			current_x, current_y= current_x + dx, current_y + dy 
			current_position = [current_x, current_y]
			break unless board.valid_position?(current_position)

			if board.empty?(current_position)
				moves << current_position
			else 
				if board[current_position].color != color 
					moves << current_position
				end

				break 
			end
		end
		moves 
	end
end