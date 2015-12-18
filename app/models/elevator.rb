class Elevator < ActiveRecord::Base
	attr_accessor :current_floor, :destination, :passengers, :empty, :trips, :door_status

	def respond_to_call
		puts 'in respond_to_call'
	end

	private

	def set_default_floor
		puts 'in the create'
		self.current_floor ||= 1
	end

	def the_current_floor
		puts 'in the_current_floor'
		puts self.current_floor
	end
	
end
