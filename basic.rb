# This is to test a basic trading mechanicsm.

# Header text confirms that the game has loaded.
puts "Welcome to Basic Trading!\n"
puts "This is an exciting game where you buy and sell only two items in two locations.\n"
 
# Initialize Classes
class Player
	attr_accessor :money, :items
	def initialize(money, items)
		@money = money 				# Stored as Integer
		@items = items				# Stored as Array of hashes
	end
	def bio
		puts "Player has $#{money} and #{items}.\n"
	end
	def make_starting_goods(keys)
	  	hash = {}
	    keys.each do |key|
	    hash[key] = 0
	    end
		self.items.merge!(hash)
	end
end

class Goods
	attr_accessor :title, :base_value, :current_value
	def initialize(title, base_value, current_value)
		@title = title
		@base_value = base_value
		@current_value = current_value
	end
end

class Location
	attr_accessor :name
	def initialize(name)
		@name = name
	end
end

# Initialize Custom Methods
def instructions
puts "Type (I)nventory, (B)uy, (S)ell, (T)ravel or (Q)uit.\n"
end

# Instantiate Market Goods
market_stuff = [] # Make full list of all items
wheat = Goods.new("Wheat", 10, 10)
market_stuff << wheat
ore = Goods.new("Ore", 20, 40)
market_stuff << ore
puts Goods.variety.inspect

# Instantiate Locations
total_locations = []
venice = Location.new("Venice")
total_locations << venice
baghdad = Location.new("Baghdad")
total_locations << baghdad
current_location = venice

# Instantiate Player
player1 = Player.new(100, {})
player1.bio
puts "Attempting to merge Market stuff with player inventory.\n"
player1.make_starting_goods(market_stuff)
player1.bio

=begin
# Test for putting items in users inventory.
puts "Test for putting items in users inventory.\n"
player1.items[wheat] = 5
puts "Player1 bio:\n"
player1.bio
puts "Testing selling goods and updating money.\n"
puts "Adjust value of wheat:\n"
wheat.current_value = wheat.base_value * 7
puts "Wheat's current value: #{wheat.current_value}\n"
units = player1.items[wheat]
puts "Units: #{units}\n"
cost = units*wheat.current_value
puts "Cost: #{cost}\n"
puts "Selling goods and gaining profit.\n"
player1.money = player1.money + cost
puts "New Money:\n"
puts "Money: #{player1.money}\n"
puts "Current Wheat amount before subtraction: #{player1.items[wheat]}.\n"
player1.items[wheat] = player1.items[wheat] - units
puts "Player1 updated bio:\n"
player1.bio

puts "Cancel here\n"
gets.chomp
# End test
=end 

# Start Game Loop
current_location = venice
market_stuff.each { |a| a.current_value = a.base_value * (1 + rand(6))}
puts "Hit Enter to Start.\n"
while command = gets.chomp
	puts "Start of loop.\n"
	case command
	when "I"
		puts "Money: #{player1.money}.\n"		
		puts "Items: #{player1.items}.\n"
		puts "Hit Enter to Continue.\n"
	when "B"
		puts "You want to Buy.\n"
		choice = {}
		i = 0
		market_stuff.each do |x|
			puts "Item: #{x.title}\n"
			puts "Price: #{x.current_value}\n"
	    	choice[x] = i + 1
	    	i = i + 1
	    	puts "Option: #{choice[x]}"
		end
		puts "Type the Option number of the item you want to buy:\n"
		while buy = gets.chomp.to_i
			if choice.values.include?(buy) == true
				b = choice.select {|k,v| v == buy}
				puts "You want to buy #{b}.\n"
				puts "How many units?\n"
				units = gets.chomp.to_i
				cost = units * b.current_value
				if cost > player1.money
					puts "You do not have enough money.\n"
				elsif cost < 0
					puts "Somehow the cost is less than 0.\n"
				else
					player1.money = player1.money - cost
					player1.items[b] = player1.items[b] + units
				end
			else
				puts "Type the option number.\n"
				puts "To cancel, select an option and buy 0 units.\n"
			end
		end
# Need to redo how items are held in inventory. Current method is not acceptable.
# Instance Variables need to be stores as strings
# Consider the following wheat.instance_variables.each_with_object({}) { |var,hash| hash[var.to_s.delete("@")] = wheat.instance_variable_get(var) }
	
		if buy == "A"
			puts "How many units?\n"
			units = Integer(gets) rescue nil
			cost = units*item_a
			if cost > money
				puts "You do not have enough money.\n"
			elsif cost < 0
				puts "I dont think you get how money works.\n"
			else
				money = money - cost
				item_a_count = item_a_count + units
				puts "You bought #{units} of Item A for $#{cost}.\n"
			end
			puts "Hit Enter to continue.\n"
		elsif buy == "B"
			puts "How many units?\n"
			units = Integer(gets) rescue nil
			cost = units*item_b
			if cost > money
				puts "You do not have enough money.\n"
			elsif cost < 0
				puts "I dont think you get how money works.\n"
			else
				money = money - cost
				item_a_count = item_b_count + units
				puts "You bought #{units} of Item B for $#{cost}.\n"
			end
			puts "Hit Enter to continue.\n"
		elsif buy == "X"
			puts "Cancel trade.\n"
			break
		else
			puts "Type (A), (B) or (X) to cancel.\n"
		end
	when "S"
		puts "You want to Sell.\n"
		list_goods(item_a, item_b)
		puts "Type which good you want to sell: Item A (A) or Item B (B)\n"
		sell = gets.chomp
		puts "How many do you want to sell?\n"
		if sell == "A"
			puts "How many units?\n"
			units = Integer(gets) rescue nil
			cost = units*item_a
			if units > item_a_count
				puts "You do not have that many to sell.\n"
			elsif item_a_count < 0
				puts "Enter a number above 0.\n"
			else
				money = money + cost
				item_a_count = item_a_count - units
				puts "You sold #{units} of Item A for $#{cost}.\n"
			end
			puts "Hit Enter to continue.\n"
		elsif sell == "B"
			puts "How many units?\n"
			units = Integer(gets) rescue nil
			cost = units*item_b
			if units > item_b_count
				puts "You do not have that many to sell.\n"
			elsif item_b_count < 0
				puts "Enter a number above 0.\n"
			else
				money = money + cost
				item_b_count = item_b_count - units
				puts "You sold #{units} of Item B for $#{cost}.\n"
			end
			puts "Hit Enter to continue.\n"
		elsif sell == "X"
			puts "Type (A), (B) or (X) to cancel.\n"
			break
		else
			instructions
		end
	when "T"
		puts "You are traveling to the other market.\n"
		if location == 0
			location = 1
		else
			location = 0
		end
		puts "You are traveling.\n"
		puts "Hit Enter to continue.\n"
	when "Q"
		puts "Goodbye!\n"
		break
	else
		instructions
	end
end