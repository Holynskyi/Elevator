class Engine
private
	attr_accessor :working, :power
	def initialize (p)
		p "Engine #{p}kW init"
		@power=p
		@working= power==2 ? true : false
	end
public
	def turn_on
		@working=true
	end
	def turn_off
		@working=false
	end
end