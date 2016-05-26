class Elevator
	attr_accessor :passengers, :current_floor, :direction
private
	attr_accessor :in_displey, :engine1, :engine2, :total_mass, :speed
	def initialize
		@in_displey=Inner_displey.new
		@engine1=Engine.new(1)
		@engine2=Engine.new(2)
		@passengers=[]
		@current_floor=1
		@direction=1
		@total_mass=0
		@speed=0
		p "Elevator init"
	end
public
	def take_passengere (p)
		@passengers<<p
		p "#{p.name} has been taken from #{@current_floor} floor"
		@total_mass+=p.mass
		@engine1.turn_on if @passengers.length>3#вмикаємо другий мотор
	end

	def release_passengers
		i=0
		while i<@passengers.length
			if @passengers[i].destination_floor==@current_floor
				p "say good bye to #{@passengers[i].name}, he has ended his journey"
				@total_mass-=@passengers[i].mass
				@passengers.delete_at(i)
			else
				i=i+1
			end
		end
		@engine1.turn_off if @passengers.length<=3#вимикаємо другий мотор
	end

	def get_mass
		return @total_mass
	end

	def set_speed(s)
		@speed=s.to_i
	end

	def show_speed
		return @speed
	end

	def move_up
		@current_floor+=1
		@direction=1
		set_speed(1+10*Math.exp(-@passengers.length/10.0))
		p "lift moves up to #{@current_floor} floor"
		@in_displey.get_inf(@current_floor,@direction)
	end

	def move_down
		@current_floor-=1
		@direction=-1
		set_speed(1+10*Math.exp(-@passengers.length/10.0))
		p "lift moves down to #{@current_floor} floor"
		@in_displey.get_inf(@current_floor,@direction)
	end
end

