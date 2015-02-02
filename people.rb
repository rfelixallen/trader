class Person
	attr_accessor :name, :origin_city

 	@@origin_city = ['Venice', 'Baghdad']

	def initialize(name, origin_city)
		@name = name
		@origin_city = origin_city
		puts "A new person has been instatiated."
	end

 	def biography
 		puts "#{name} is a merchant from #{origin_city}.\n"
 	end
end

class Player < Person
	
	def self.create_player(name, origin_city)		
	player = self.new(name, origin_city)
	end

end

def test_people
	puts "Person.rb has loaded!"
end

=begin
def questionnaire
		puts "Lets make you a character. First, what is your name?\n"
		name1 = gets.chomp.to_s
		puts name1
		puts "Next, what is your gender? Type Male or Female.\n"
		while gender1 = gets.chomp # loop while getting user input
		  case gender1
		  when "Male"
		    puts gender1
		    break # make sure to break so you don't ask again
		  when "Female"
		  	puts gender1
		  	break
		  else
		    puts "Please type exactly Male or Female. \n"
		  end
		end	
		puts "Now set your starting city. This will also choose your faith. \n"
		puts "Your choises are Venice or Baghdad. \n"
		while origin_city1 = gets.chomp # loop while getting user input
		  case origin_city1
		  when "Venice"
		    religion1 = "Christian"
		    puts origin_city1
		    puts religion1
		    break # make sure to break so you don't ask again
		  when "Baghdad"
		  	puts origin_city1
		    puts religion1
		  	break
		  else
		    puts "Please type exactly Venice or Baghdad. \n"
		  end
		end	
		player1 = Player.create_player(name1, gender1, religion1, origin_city1)
		player1.biography
end
=end