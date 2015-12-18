class Elevator
	include ActiveModel::Model
	# include ActiveModel::Serialization
	extend ActiveModel::Callbacks
	define_model_callbacks :create, :update, :save

	attr_accessor :current_floor, :destination, :passengers, :empty, :trips, :door_status

	before_create :set_default_floor

	def create
		run_callbacks :create do
			puts 'do the thing'
		end
	end

	def update
		run_callbacks :update do
			puts 'in the update'
		end
	end

	private

	def set_default_floor
		puts 'in the create'
		self.current_floor ||= 1
	end

end