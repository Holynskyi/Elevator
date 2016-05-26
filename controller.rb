class Control_computer	#він у нас головний
private
	attr_accessor :waiting_passangers, :lift, :MAX_FLOOR, :out_displays 
	def initialize
		@MAX_FLOOR=10
		@lift=Elevator.new
		@out_displays=[]
		for i in 1..@MAX_FLOOR
			@out_displays[i]=Outside_display.new(i)
		end
		@waiting_passangers=[]
		p "Control_computer init"
	end
public
	def moving
		if !(@lift.passengers.empty?)#є запити всередині ліфту
			b=-1			#перевіряємо чи є запити, співнаправлені до поточного напряму
			@lift.passengers.each{|p| b=1 if (p.destination_floor-@lift.current_floor)*@lift.direction>0 }
			b*@lift.direction>0 ? @lift.move_up : @lift.move_down #йдемо на 1 поверх вгору або вниз
		elsif !(@waiting_passangers.empty?)#немає запитів всередині ліфту, але є ззовні
			temp=(waiting_passangers[0]).initial_floor
			@waiting_passangers.each do |p|#шукаємо найближчого потребуючого
				if p.initial_floor-@lift.current_floor<temp
					temp=p.initial_floor
				end
			end
			temp-@lift.current_floor>0 ? @lift.move_up : @lift.move_down #йдемо на 1 поверх вгору або вниз
		else #немає запитів 
			p "lift is resting on  the #{@lift.current_floor} floor"
			@lift.set_speed(0)
		end
	end

	def new_passenger	#створююємо нового очікуючого пасажира
		@waiting_passangers<<Passengere.new(rand(@MAX_FLOOR)+1,rand(@MAX_FLOOR)+1)
	end	

	def picking_up_passengers
		p "picking_up_passengers start"
		i=0
		while i<@waiting_passangers.length
			#p "passenger #{p.name}, #{p.initial_floor} checking"
			#break if gets=='ex' 
			if @waiting_passangers[i].initial_floor==@lift.current_floor
				@lift.take_passengere (@waiting_passangers[i])	#передаємо пасажира в ліфт
				@waiting_passangers.delete_at(i)				#забираємо пасажира із множини очікуючих
				#p waiting_passangers
			else
				i=i+1
			end
		end
	end

	def banishing_passengers
		p "banish_passengers start"
		@lift.release_passengers
	end

	def show_everything
		p "God mode activated"
		p "The elevator is on the #{@lift.current_floor} floor and moving #{@lift.direction==1 ? 'upward' : 'downward'} with speed #{@lift.show_speed} km/h."
		p "There are #{@lift.passengers.length} people in the elevator with total mass of #{lift.get_mass} kg. More detailed:"
		@lift.passengers.each do |p|
			puts "#{p.name} entered on #{p.initial_floor} floor and heading to #{p.destination_floor} floor. His mass is #{p.mass} kg."
		end
		p "There are #{@waiting_passangers.length} people waiting for the elevator. More detailed:"
		@waiting_passangers.each do |p|
			puts "#{p.name} is waiting on #{p.initial_floor} and wants to reach #{p.destination_floor} floor. His mass is #{p.mass} kg."
		end
		p "End God mode"
		gets
	end
end