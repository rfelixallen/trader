require_relative 'globe'
require_relative 'people'

puts "Hello world!\n"

test_globe # Tests if globe.rb has loaded.
test_people # Tests if people.rb has loaded.

#questionnaire # Creates the player in people.rb
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