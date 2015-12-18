class ElevatorController < ApplicationController

	def index
	end

	def enter_maintenance(elevator)
		update_elevator_status(@elevator, :destination, false)
	end

	def get_closest_elevator(destination)

		@elevators = Elevator.where(in_service: true, emtpy: true)

		closest_elevator = nil
		distance = nil

		@elevators.each |do| |elevator|
			:new_distance = elevator.current_floor - destination

			if :new_distance < :distance
				closest_elevator = elevator
				distance = new_distance
			end #end if
		end #end do
	end

	def summon

		@floor = Floor.find(:id = params[:destination])

		if !@floor.closed || params[:destination] <= Floor.top_floor
			destination = params[:destination]
		else
			return false
		end

		@elevator = get_closest_elevator(:destination)

		update_elevator_status(@elevator, :destination)

		update_maintenance

	end

	def update_elevator_status(elevator, destination, in_service = true)
		distance = elevator.current_floor - destination
		floors = elevator.floors + distance
		trip = elevator.trips + 1
		elevator.update(trips: trip, floors: floors, in_service: in_service)
	end

	def update_maintenance
		@elevators = Elevator.where(in_service: true)

		@elevators.each do |elevator|
			if elevator.trips >= 100
				enter_maintenance(elevator)
			end #end if
		end #end do
	end


end