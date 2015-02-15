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
	def add_item(x)
		self.items << x
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
	@@variety = []
	def initialize(title, base_value, current_value)
		@title = title
		@base_value = base_value
		@current_value = current_value
		@@variety << self
	end
	def self.variety
		@@variety
	end
	def appraise(x)
		self.current_value = self.base_value * x
		puts self.current_value
	end
	def self.review
		puts "Item: #{title}.\n"
		puts "Base Value: #{base_value}.\n"
		puts "Current Value: #{current_value}.\n"
	end
end

class Location
	attr_accessor :name
	@@total_locations = []
	def initialize(name)
		@name = name
		@@total_locations << self
	end
	def set_prices(total_locations, market)
		# This is suppose to take in all locations, and the array of markrt items.
		# For each location, adjust the current value of each item.
		all_items = market
		total_locations.each do |x|
			all_items.each do |y|
				r = 1 + rand(6)
				self.current_value = self.base_value * r
			end
		end
	end
end

# Initialize Custom Methods
def instructions
puts "Type (I)nventory, (B)uy, (S)ell, (T)ravel or (Q)uit.\n"
end

def inventory(money, item_a_count, item_b_count)
	puts "Your Inventory\n"
	puts "Money: $#{money}.\n"
	puts "Item A: #{item_a_count}\n"
	puts "Item B: #{item_b_count}\n"
	puts "Hit Enter to continue.\n"
end

def list_goods(item_a, item_b)
	puts "Item A costs $#{item_a}.\n"
	puts "Item B costs $#{item_b}.\n"
end


# Instantiate Market Goods
market_stuff = [] # Make full list of all items
wheat = Goods.new("Wheat", 10, 10)
market_stuff << wheat
ore = Goods.new("Ore", 20, 10)
market_stuff << ore
puts Goods.variety.inspect

# Instantiate Player
player1 = Player.new(100, {"Test" => 0})
player1.bio
puts "Attempting to merge Market stuff with player inventory.\n"
player1.make_starting_goods(market_stuff)
player1.bio

# Old method for money and storing items
money = 100
location = 0
item_a = 10
item_a_count = 0
item_b = 10
item_b_count = 0

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

# Start Game Loop
puts "Hit Enter to Start.\n"
while command = gets.chomp
	puts "Start of loop.\n"
	if location == 0
		puts "You are in Location A.\n"
		# wheat.current_value = wheat.base_value * 7
		# market_stuff 
		item_a = 10 * 5
		item_b = 10 * 2
		
		#market_stuff.each do |x|
	else
		puts "You are in Location B.\n"
		item_a = 10 * 2
		item_b = 10 * 5
	end
	case command
	when "I"
		inventory(money, item_a_count, item_b_count)
	when "B"
		puts "You want to Buy.\n"
		list_goods(item_a, item_b)
		puts "Type which good you want to buy: Item A (A) or Item B (B)\n"
		buy = gets.chomp
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