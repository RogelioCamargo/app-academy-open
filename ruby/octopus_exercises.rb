# O (n log n)
# def biggest_fish(fishes)
# 	fishes.sort { |a, b| b.length - a.length }[0]
# end

# O (n)
def biggest_fish(fishes)
	fishes.inject { |a, b| a.length > b.length ? a : b }
end

# p biggest_fish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
# => "fiiiissshhhhhh"

# O (n)
# def slow_dance(move, tiles)
# 	tiles.each_with_index { |tile, index| return index if move == tile }
# 	nil
# end

# O (1)
def slow_dance(move, tiles)
	tiles[move]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6, "left-up"=>7}
p slow_dance("up", tiles_hash)
# => 0

p slow_dance("right-down", tiles_hash)
# => 3