load 'engine.rb'
load 'passengere.rb'
load 'display.rb'
load 'elevator.rb'
load 'controller.rb'

skynet=Control_computer.new

loop do
	s=gets.chomp
	if s=="God mode"
		skynet.show_everything
	elsif !(s.empty?)
		break
	end

	skynet.picking_up_passengers		#підбираємо пасажирів, якщо є на поверсі
	skynet.banishing_passengers		#випускаємо пасажирів, що приїхали

	skynet.moving					#рухаємось на 1 поверх
	skynet.new_passenger if rand<0.5	#можливо створимо нового пасажира
end
