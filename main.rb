require_relative 'globe'
require_relative 'people'

puts "Hello world!"

test_globe
test_people

questionnaire

=begin
puts "Lets make you a character. First, what is your name?\n"
name1 = gets.chomp
puts name1
puts "Next, what is your gender? Type Male or Female.\n"
gender1 = gets.chomp
puts gender1
puts "Now set your starting city. This will also choose your faith. \n"
puts "Your choises are Venice or Baghdad. \n"
origin_city1 = gets.chomp
if origin_city1 == 'Venice'
	religion1 = 'Christian'
else
	religion1 = 'Muslim'
end
puts origin_city1
puts religion1
player1 = Player.create_player(name1, gender1, religion1, origin_city1)
player1.biography
=end