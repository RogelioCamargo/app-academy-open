require "colorize"
require_relative "board"
require_relative "cursor"

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def build_grid
    @board.rows.map.with_index do |row, row_index|
      build_row(row, row_index)
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

  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end

end

# b = Board.new 
# d = Display.new(b)

# loop do 
# 	d.render
# 	d.cursor.get_input
# end