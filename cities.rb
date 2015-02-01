require_relative 'globe'

class City
	attr_accessor :name, :region_location

	def initialize(name, region_location)
		@name = name
		@region_location = region_location
	end
end

#populate regions with cities
=begin
regions1 = globe.regions
regions1 = ["Europe", "Mid East"]
cities1 = ["Rome", "Venice"]
cities2 = ["Baghdad", "Mecca"]

#Make a hash where each array entry becomes the key in a new hash, and the city arrays are the value.

# By Hand
c = Hash.new
c['Europe'] = cities1
c['Mid East'] = cities2

c['Europe'] << "Paris"  # This will add Paris to the hash.
	
end