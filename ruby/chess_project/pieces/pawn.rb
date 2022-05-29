require_relative "piece"

class Pawn < Piece
	def symbol 
		'♟'.colorize(color)
	end

	def moves 
		forward_steps + side_attacks
	end 

	private 

	def at_start_row? 
		position[0] == (color == :white ? 6 : 1)
	end

	def forward_direction 
		color == :white ? -1 : 1
	end

	def forward_steps 
		x, y = position
		one_step = [x + forward_direction, y]
		return [] unless board.valid_position?(one_step) && board.empty?
		moves = [one_step]
		two_step = [1 + 2 * forward_direction, y]
		moves << two_step if at_start_row? && board.empty?(two_step)
		moves 
	end

	def side_attacks 
		x, y = position
		left_attack = [x + forward_direction, y - 1]
		right_attack = [x + forward_direction, y + 1] 
		moves = [left_attack, right_attack]
		moves.select do |new_position|
			next false unless board.valid_position?(new_position)
			next false unless board.empty?(new_position)

			# threatened_piece = board[new_position]
			# threatened_piece && threatened_piece.color != color
			threatened_piece.color != color
		end
	end
end