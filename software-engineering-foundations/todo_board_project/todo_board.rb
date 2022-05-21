require_relative "list.rb"
class TodoBoard
	def initialize(label)
		@list = List.new(label)
	end

	def get_command
		print "\nEnter a command: "
		command, *args = gets.chomp.split(" ")

		case command
		when "mktodo"
			title, deadline, description = args
			@list.add_item(title, deadline, description)
		when "up"
			index, amount = args 
			@list.up(index, amount)
		when "down"
			index, amount = args 
			@list.down(index, amount)
		when "swap"
			index_1, index_2 = args 
			@list.swap(index_1, index_2)
		when "sort"
			@list.sort_by_date!
		when "priority"
			@list.print_priority
		when "print"
			if args.length != 0
				@list.print_full_item(args[0])
			else 
				@list.print
			end
		when "quit"
			return false 
		else 
			print "Sorry, that command is not recognized."
		end

		true 
	end

	def run
		user_wants_to_continue = true 
		while user_wants_to_continue do 
			user_wants_to_continue = get_command
		end
	end
end