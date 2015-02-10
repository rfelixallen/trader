# This is to test a basic trading mechanicsm.
puts "Welcome to Basic Trading!\n"
puts "This is an exciting game where you buy and sell only two items in two locations.\n"

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

def for_sale
	if location == 1
		item_a = item_a*5
		item_b = item_b*2
	else
		item_a = item_a*2
		item_b = item_b*5
	end
end

money = 100
location = 0
item_a = 10
item_a_count = 0
item_b = 10
item_b_count = 0

puts "Hit Enter to Start.\n"
while command = gets.chomp
	puts "Start of loop.\n"
	#instructions
	if location == 0
		puts "You are in Location A.\n"
	else
		puts "You are in Location B.\n"
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
		puts "You are traveling."
	when "Q"
		puts "Goodbye!\n"
		break
	else
		instructions
	end
end