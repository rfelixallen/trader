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

	def report
		name = self.name
		origin = region_location
		puts "The name of the city is #{name}, located in #{origin}."
	end
end