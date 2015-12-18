class ElevatorController < ApplicationController

	def index
		@elevator = Elevator.new(
			current_floor: 1,
			destination: nil,
			empty: true,
			passengers: 0,
			trips: 0,
			door_status: 'closed'
			)
	end

	def summon
		# assuming input from elevator
		@elevator = Elevator.find(:id = params[:id])

		@floor = Floor.find(:id = params[:destination])

		if !@floor.closed || params[:destination] <= Floor.top_floor
			@elevator.destination = params[:destination]
		else
			return false
		end

	end
end