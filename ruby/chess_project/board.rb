require_relative "pieces"

class Board 
	attr_reader :rows
	def initialize(fill_board = true)
		@sentinel = NullPiece.instance
		populate_rows(fill_board)
	end

	def [](position)
		row, col = position
		@rows[row][col]
	end

	def []=(position, piece)
		row, col = position 
		@rows[row][col] = piece 
	end

	def add_piece(piece, position)
		raise "position not empty" unless empty?(position)
		self[position] = piece 
	end

	def empty?(position)
		self[position].empty? 
	end

	def valid_position?(position)
		position.all? { |coordinate| coordinate.between?(0, 7) }
	end

	def move_piece(turn_color, start_position, end_position)
		raise "start position is empty" if empty?(start_position)
		piece = self[start_position]

		if piece.color != turn_color 
			raise "you must move your own pieces"
		elsif !piece.moves.include?(end_position)
			raise "piece does not move like that"
		end

		move_piece!(start_position, end_position)
	end

	def move_piece!(start_position, end_position)
		piece = self[start_position]
		raise "piece does not move like that" unless piece.moves.include?(end_position)

		self[start_position] = sentinel 
		self[end_position] = piece 
		piece.position = end_position
	end

	def pieces 
		rows.flatten.reject(&:empty?)
	end

	def in_check?(color)
		king_position = find_king(color).position
		pieces.any? do |piece|
			piece.color != color && piece.moves.include?(king_position)
		end
	end

	def checkmate?(color)
		return false unless in_check?(color)

		pieces.select { |piece| piece.color == color }.all? do |piece|
			piece.valid_moves.empty?
		end
	end

	def dup 
		board_dup = Board.new(false)
		pieces.each do |piece| 
			piece.class.new(piece.color, board_dup, piece.position) 
		end
		board_dup
	end

	private 

	attr_reader :sentinel 

	def find_king(color)
		king_piece = pieces.find { |piece| piece.color != color && piece.is_a?(King) }
		king_piece || (raise "king not found")
	end

	def fill_back_row(color)
		back_pieces = [
      Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
    ]
		row = color == :white ? 7 : 0 
		back_pieces.each_with_index do |piece, index|
			piece.new(color, self, [row, index])
		end
	end

	def fill_pawn_row(color)
		row = color == :white ? 6 : 1 
		(0..7).each do |index|
			Pawn.new(color, self, [row, index])
		end
	end

	def populate_rows(fill_board)
		@rows = Array.new(8) { Array.new(8, sentinel) }
		return unless fill_board
		%i(white black).each do |color|
			fill_back_row(color)
			fill_pawn_row(color)
		end
	end
end