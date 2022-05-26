class Tile 
	DELTAS = [
		[0, 1], [1, 0], [0, -1], [-1, 0],
		[-1, -1], [-1, 1], [1, -1], [1, 1]
	].freeze
	
	attr_reader :position, :board

	def initialize(board, position)
		@board = board 
		@position = position
		@bombed, @flagged, @explored = false, false, false 
	end 

	def bombed? 
		@bombed
	end

	def flagged? 
		@flagged
	end

	def explored? 
		@explored
	end

	def plant_bomb
		@bombed = true
	end

	def toggle_flag 
		@flagged = !flagged? unless explored?
	end

	def explore 
		return self if flagged?
		return self if explored?

		@explored = true 
		if neighbor_bomb_count == 0 && !bombed?
			neighbors.each { |neighbor| neighbor.explore }
		end

		self
	end

	def neighbors 
		neighbor_coordinates = DELTAS.map do |(dx, dy)|
			x, y = position
			[x + dx, y + dy] 
		end.select do |position|
			position.all? { |coordinate| coordinate.between?(0, board.size - 1) }
		end

		neighbor_coordinates.map { |position| board[position] }
	end

	def neighbor_bomb_count 
		neighbors.select { |neigbor| neigbor.bombed? }.count 
	end

	def inspect 
		{
			position: position,
			bombed: bombed?,
			flagged: flagged?,
			explored: explored?
		}.inspect
	end

	def render 
		if flagged? 
			"F"
		elsif explored?
			neighbor_bomb_count == 0 ? "_" : neighbor_bomb_count.to_s
		else 
			"*"
		end
	end

	def reveal 
		if flagged?
			bombed? ? "F" : "N"
		elsif bombed? 
			explored? ? "X" : "B"
		else 
			neighbor_bomb_count == 0 ? "_" : neighbor_bomb_count.to_s
		end
	end
end