def test_globe
	puts 'globe.rb has loaded!'
end

Class Globe
	attr_accessor :terra, :regions, :cities
	@@terra = ['Earth']
	@@regions = ['Europe', 'Middle East']
	@@cities = ['Venice', 'Baghdad']

	def initialize
		@terra = terra
		@regions = regions
		@cities = cities
	end
end

Class Region
end

Class City
end