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
		item_a = item_a*1.5
		item_b = item_b*0.5
	else
		item_a = item_a*0.5
		item_b = item_b*1.5
	end
end

money = 100.0
location = 0
item_a = 10.0
item_a_count = 0
item_b = 10.0
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
		puts "How many do you want to buy?\n"
		if buy == "A"
			puts "How many units?\n"
			units = gets.chomp.to_f
			cost = units*item_a
			money = money - cost
			item_a_count = item_a_count + units
			puts "You bought #{units} of Item A for $#{cost}.\n"
			puts "Hit Enter to continue.\n"
		elsif buy == "B"
			puts "How many units?\n"
			units = gets.chomp.to_f
			cost = units*item_b
			money = money - cost
			item_b_count = item_b_count + units
			puts "You bought #{units} of Item B for $#{cost}.\n"
			puts "Hit Enter to continue.\n"
		elsif buy == "X"
			puts "Cancel trade.\n"
			break
		else
			instructions
		end
	when "S"
		puts "You want to Sell.\n"
		list_goods(item_a, item_b)
		puts "Type which good you want to sell: Item A (A) or Item B (B)\n"
		sell = gets.chomp
		puts "How many do you want to sell?\n"
		if sell == "A"
			puts "How many units?\n"
			units = gets.chomp.to_f
			cost = units*item_a
			money = money + cost
			item_a_count = item_a_count - units
			puts "You sold #{units} of Item A for $#{cost}.\n"
			puts "Hit Enter to continue.\n"
		elsif sell == "B"
			puts "How many units?\n"
			units = gets.chomp.to_f
			cost = units*item_b
			money = money + cost
			item_b_count = item_b_count - units
			puts "You sold #{units} of Item B for $#{cost}.\n"
			puts "Hit Enter to continue.\n"
		elsif sell == "X"
			puts "Cancel trade.\n"
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