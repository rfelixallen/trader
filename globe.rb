def test_globe
	puts 'globe.rb has loaded!'
end

class Globe
	attr_accessor :terra, :regions
	@@terra = ['Earth']
	@@regions = ['Europe', 'Middle East']

	def initialize(terra="Earth", regions=["Europe", "The Middle East"])
		@terra = terra
		@regions = regions
		puts "A new world has been instatiated."
	end
end

class Region < Globe
end