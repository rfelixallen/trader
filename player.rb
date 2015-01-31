class Player
	attr_accessor :name, :gender, :religion, :origin_city

	@@geneder

	def self.create(name, gender, religion, origin_city)
		puts "A new merchant is born. Tell me your name.\n"
		player = 