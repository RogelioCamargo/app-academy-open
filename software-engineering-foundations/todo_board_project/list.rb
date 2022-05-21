require_relative "item.rb"
class List 
	attr_accessor :label 
	
	def initialize(label)
		@label = label 
		@items = []
	end

	def priority
		return nil if self.size == 0

		@items[0]
	end

	def size
		@items.length
	end

	def valid_index?(index)
		index >= 0 && index < self.size 
	end

	def swap(index_1, index_2)
		index_1 = index_1.to_i
		index_2 = index_2.to_i
		return false if !valid_index?(index_1) || !valid_index?(index_2)

		@items[index_1], @items[index_2] = @items[index_2], @items[index_1]
		true
	end

	def [](index)
		return nil if !valid_index?(index)
			
		@items[index]
	end

	def add_item(title, deadline, description = "")
		begin
			new_item = Item.new(title, deadline, description)
		rescue => exception
			return false 
		else
			@items << new_item 
			return true 
		end
	end

	def up(index, amount)
		index = index.to_i
		amount ||= 1
		return false if !valid_index?(index)

		current_index = index 
		swaps_remaining = amount.to_i
		while current_index > 0 && swaps_remaining > 0 do 
			next_index= current_index - 1
			swap(current_index, next_index)
			current_index = next_index
			swaps_remaining -= 1
		end

		true
	end

	def down(index, amount)
		index = index.to_i
		amount ||= 1
		return false if !valid_index?(index)

		current_index = index 
		swaps_remaining = amount.to_i
		while current_index < self.size - 1 && swaps_remaining > 0 do 
			next_index= current_index + 1
			swap(current_index, next_index)
			current_index = next_index
			swaps_remaining -= 1
		end

		true
	end

	def sort_by_date!
		@items.sort_by! { |item| item.deadline }
	end

	def print 
		puts Array.new(5 + 25 + 12).fill("-").join("")
		puts self.label.upcase
		puts Array.new(5 + 25 + 12).fill("-").join("")
		@items.each_with_index do |item, index|
			puts "#{index.to_s.ljust(5)} | #{item.title.ljust(25)} | #{item.deadline.ljust(12)}"
		end
		puts Array.new(5 + 25 + 12).fill("-").join("")
	end

	def print_full_item(index)
		index = index.to_i
		return if !valid_index?(index)

		item = self[index]
		puts Array.new(5 + 25 + 12).fill("-").join("")
		puts item.title
		puts item.deadline 
		puts item.description 
		puts Array.new(5 + 25 + 12).fill("-").join("")
	end

	def print_priority
		print_full_item(0)
	end
end