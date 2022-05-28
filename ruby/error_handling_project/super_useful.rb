# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
	def message 
		"I love coffee but not today, please try again. "
	end
end
class NotAFriutError < StandardError
	def message 
		"That doesn't look like a fruit. You tricked me. * runs away *"
	end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
	elsif maybe_fruit.downcase == "coffee"
    raise CoffeeError 
	else 
		raise NotAFriutError
  end 
end



def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
rescue NotAFriutError => e
	puts e.message
rescue CoffeeError => e 
	puts e.message
	retry 
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
		raise ArgumentError.new "Years known must be more than or equal to 5 years" if yrs_known < 5
		raise ArgumentError.new "Name can't be blank" if name.empty? 
		raise ArgumentError.new "Favorite pasttime can't be blank" if fav_pastime.empty?
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


