class Inner_displey
private
	attr_accessor :lift_floor, :lift_direction
public
	def get_inf(f,d)
		@lift_floor=f;
		@lift_direction=d;
	end

	def show_lift_inf
		p "Lift is on the #{@lift_floor} floor and moving #{@lift_direction=1 ? 'upward' : 'downward'}"
	end
end

class Outside_display < Inner_displey
private
	attr_accessor :floor
	def initialize (n)
		#p "#{n} floor outside_display init"
		@floor=n
	end
public
	def show_inf
		p "You are on yhe #{@floor} floor"
		self.show_lift_inf
	end
end