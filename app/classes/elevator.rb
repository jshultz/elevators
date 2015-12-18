class Elevator
	include ActiveModel::Model

	attr_accessor :current_floor, :passengers, :emtpy, :trips, :door_status

	before_save :default_values

	def default_values
		self.current_floor ||= 1
	end

	def self.bar
		puts 'class method'
	end

end