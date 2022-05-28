require_relative 'tic_tac_toe'

class TicTacToeNode
	attr_reader :board, :next_mover_mark, :prev_move_pos 

  def initialize(board, next_mover_mark, prev_move_pos = nil)
		@board = board 
		@next_mover_mark = next_mover_mark
		@prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
		if board.over? 
			return board.won? && board.winner != evaluator
		end

		if next_mover_mark == evaluator 
			children.all? { |child| child.losing_node?(evaluator) }
		else 
			children.any? { |child| child.losing_node?(evaluator) }
		end
  end

  def winning_node?(evaluator)
		if board.over? 
			return board.won? && board.winner == evaluator
		end

		if next_mover_mark == evaluator 
			children.any? { |child| child.winning_node?(evaluator) }
		else 
			children.all? { |child| child.winning_node?(evaluator) }
		end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
		children = []
		(0..2).each do |row|
			(0..2).each do |col|
				pos = [row, col]
				if board.empty?(pos)
					dup_board = board.dup
					dup_board[pos] = self.next_mover_mark
					next_mover_mark = self.next_mover_mark == :x ? :o : :x
					children << TicTacToeNode.new(dup_board, next_mover_mark, pos)
				end
			end
		end
		children
  end
end
