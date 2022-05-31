require_relative "player"

class HumanPlayer < Player 
	def make_move
		start_position, end_position = nil, nil 
		until start_position && end_position
			display.render 

			if start_position
				puts "#{color}'s turn. Move to where?"
				end_position = display.cursor.get_input

				display.reset! if end_position
			else
				puts "#{color}'s turn. Move from where?"
				start_position = display.cursor.get_input

				display.reset! if start_position
			end
		end
		[start_position, end_position]
	end
end