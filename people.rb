def test_people
	puts "Person.rb has loaded!"
end

class Person
	attr_accessor :name, :gender, :religion, :origin_city

	@@geneder = ['Male', 'Female'] # keeping it simple. Would like to introduce other genders too.
	@@religion = ['Christian', 'Muslim'] # Two options for now. More to come.
 	@@origin_city = ['Venice', 'Baghdad']

 	def self.biography
 		if gender == 'Male'
 		puts "#{name} is a merchant from #{origin_city}. He is a member of the #{religion} faith.\n"
 		else
 		puts "#{name} is a merchant from #{origin_city}. She is a member of the #{religion} faith.\n"
 		end
 	end
end

class Player < Person
	
	def self.create_player(name, gender, religion, origin_city)		
	player = self.new(name, gender, religion, origin_city)
	end

end

