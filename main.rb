require_relative 'globe'
require_relative 'people'

puts "Hello world!"

test_globe
test_people

puts "What is your name? \n"
player = gets.chomp.downcase
puts player