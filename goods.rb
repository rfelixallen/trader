def test_goods
	puts "goods.rb has loaded!"
end

class Goods
	attr_accessor :title, :type, :base_value

	inventory = {"Wheat" => 1, "Swords" => 5, "Jewlery" => 10}

	def initialize(title, type, base_value)
		@title = title
		@type = type
		@base_value = base_value
	end

	def for_sale
		puts "Today the market has the following: \n"
		inventory.each { |inventory| puts inventory + "\n"}
	end
end
