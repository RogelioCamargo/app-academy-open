require "colorize"
require_relative "cursor"

class Display
  attr_reader :board, :cursor, :notifications

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
		@notifications = {}
  end

	def reset! 
		@notifications.delete(:error)
	end

	def uncheck!
		@notifications.delete(:check)
	end

	def set_check! 
		@notifications[:check] = "Check!"
	end

  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }

		@notifications.each do |key, value|
			puts value
		end
  end

	private 

	def build_grid
		puts "  #{("a".."h").to_a.map { |char| " #{char} " }.join}"
		row_indices = (1..8).to_a.reverse
    board = @board.rows.map.with_index do |row, row_index|
      ["#{row_indices[row_index]} "] + build_row(row, row_index)
    end
  end

  def build_row(row, row_index)
    row.map.with_index do |piece, col_index|
      color_options = colors_for(row_index, col_index)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(r, c)
    if cursor.cursor_position == [r, c] && cursor.selected
      bg = :light_green
    elsif cursor.cursor_position == [r, c]
      bg = :light_red
    elsif (r + c).odd?
      bg = :light_blue
    else
      bg = :light_yellow
    end
    { background: bg }
  end

end