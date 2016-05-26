class Passengere
	attr_accessor :name, :mass, :initial_floor, :destination_floor
	def initialize (i,d)
		@initial_floor=i
		@destination_floor=d
		n=rand(10)
		case n
		when 0
			@name="Adam"
		when 1
			@name="Alice"
		when 2
			@name="Bob"
		when 3
			@name="Eve"
		when 4
			@name="Harry"
		when 5
			@name="Tom"
		when 6
			@name="John"
		when 7
			@name="Will"
		when 8
			@name="David"
		when 9
			@name="Germiona"
		else
			p "this is impossible, if you are reading this you are sleaping"
			@name="Chuck Noris"
		end
		@name<<"(#{i},#{d})"
		@mass=rand(50..100)
		p "new passenger has been created. Hello #{@name}!"
	end
end