require_relative 'globe'
require_relative 'people'
require_relative 'cities'
#require_relative 'test'

puts "Hello world!\n"

test_globe # Tests if globe.rb has loaded.
test_people # Tests if people.rb has loaded.
test_city

# Initialize the world
globe1 = Globe.new
terra1 = globe1.terra
regions1 = globe1.regions

#questionnaire # Creates the player in people.rb
puts "Lets make you a character. First, what is your name?\n"
name1 = gets.chomp.to_s
puts name1
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
player1 = Player.create_player(name1, origin_city1)
player1.biography

puts "Now that you have entered the stage, lets discuss the world.\n"
puts "The name of the globe is #{terra1}.\n"
puts "The regions of the known world are " + regions1*", " + "."

#populate cities into regions.
cities1 = ["Rome", "Venice"]
cities2 = ["Baghdad", "Mecca"]
c = Hash.new
c[regions1[0]] = cities1
c[regions1[1]] = cities2
puts "The cities of #{regions1[0]} are:\n" 
puts c[regions1[0]]
puts "The cities of #{regions1[1]} are:\n"  
puts c[regions1[1]]

rome = City.new(cities1[0], regions1[0])
puts rome.report