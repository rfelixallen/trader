def test_goods
	puts "goods.rb has loaded!"
end

class Goods
	attr_accessor :title, :type, :base_value

	def initialize(title, type, base_value)
		@title = title
		@type = type
		@base_value = base_value
	end
end