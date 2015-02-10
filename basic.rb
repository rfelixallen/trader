# This is to test a basic trading mechanicsm.

money = 100.0
location = 0

item_a = 10.0
item_a_count = 0
item_b = 10.0
item_b_count = 0

def instructions
	puts "Type the following commands.\n"
	puts "B == Buy Goods\n"
	puts "S == Sell Goods\n"
	puts "T == Travel to other market\n"
	puts "Q == Quit game\n"
end

def inventory
	puts "Your Inventory\n"
	puts "Money: $#{money}\n."
	puts "Item A: #{item_a_count}\n"
	puts "Item B: #{item_b_count}\n"
end

def list_goods
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

while command = gets.chomp
	inventory
	if location == 0
		puts "You are in Location A.\n"
	else
		puts "You are in Location B.\n"
	end
	instructions
	case command
	when "B"
		puts "You want to Buy.\n"
		list_goods
		puts "Type which good you want to buy: Item A (A) or Item B (B)\n"
		buy = gets.chomp
		puts "How many do you want to buy?\n"
		if buy == "A"
			puts "How many units?\n"
			units = gets.chomp
			cost = units*item_a
			money = money - cost
			item_a_count = item_a_count + units
			puts "You bought #{units} of Item A for #{cost}."
			inventory
		elsif buy == "B"
			puts "How many units?\n"
			units = gets.chomp
			cost = units*item_b
			money = money - cost
			item_b_count = item_b_count + units
			puts "You bought #{units} of Item B for #{cost}."
			inventory
		elsif buy == "X"
			puts "Cancel trade.\n"
			break
		else
			puts "Type A, B or X to cancel.\n"
		end
	when "S"
		puts "You want to Sell.\n"
		list_goods
		puts "Type which good you want to sell: Item A (A) or Item B (B)\n"
		buy = gets.chomp
		puts "How many do you want to sell?\n"
		if sell == "A"
			puts "How many units?\n"
			units = gets.chomp
			cost = units*item_a
			money = money + cost
			item_a_count = item_a_count - units
			puts "You sold #{units} of Item A for #{cost}."
		elsif sell == "B"
			puts "How many units?\n"
			units = gets.chomp
			cost = units*item_b
			money = money + cost
			item_b_count = item_b_count - units
			puts "You sold #{units} of Item B for #{cost}."
		elsif sell == "X"
			puts "Cancel trade.\n"
			break
		else
			puts "Type A, B or X to cancel.\n"
		end
	when "T"
		puts "You are traveling to the other market.\n"
		if location == 0
			location = 1
		else
			location = 0
		end
	when "Q"
		puts "Goodbye!\n"
		break
	else
		puts "Enter B, S, T or Q.\n"
	end