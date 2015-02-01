require_relative 'globe'

class City
	attr_accessor :name, :region_location

	def initialize(name, region_location)
		@name = name
		@region_location = region_location
	end
end