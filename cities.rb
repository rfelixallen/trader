require_relative 'globe'

def test_city
	puts "cities.rb has loaded!"
end

class City
	attr_accessor :name, :region_location

	def initialize(name, region_location)
		@name = name
		@region_location = region_location
	end
end