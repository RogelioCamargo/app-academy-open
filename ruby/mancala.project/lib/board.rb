class Board
  attr_reader :cups, :player1_name, :player2_name

  def initialize(name1, name2)
		cups = Array.new(14)
		@cups = cups.map.with_index do |cup, index|
			if index == 6 || index == 13 
				[]
			else 
				Array.new(4, :stone)
			end
		end
		@player1_name = name1 
		@player2_name = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
		raise "Invalid starting cup" if !start_pos.between?(0, 12)
		raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
		count = cups[start_pos].count
		cups[start_pos] = [] 
		current_pos = start_pos
		while count > 0 do 
			current_pos = (current_pos + 1) % 14
			next if current_player_name != player1_name && current_pos == 6
			next if current_player_name != player2_name && current_pos == 13
			cups[current_pos] << :stone
			count -= 1
		end
		render
		next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
		return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
		return :switch if cups[ending_cup_idx].count == 1
		ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
		cups[0..5].all? { |cup| cup.empty? } || 
		cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
		case cups[6] <=> cups[13] 
		when -1
			player2_name
		when 0
			:draw
		when 1 
			player1_name
		end
  end
end
