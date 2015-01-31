class Person
	attr_accessor :name, :gender, :religion, :origin_city

	@@geneder = ['Male', 'Female'] # keeping it simple. Would like to introduce other genders too.

end

class Player < Person
	
	def self.create_player(name, gender, religion, origin_city)		
	player = self.new(name, gender, religion, origin_city)
	end

end