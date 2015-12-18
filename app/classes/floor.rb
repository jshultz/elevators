class Floor
	include ActiveModel::Model
	include ActiveModel::Serialization
	extend ActiveModel::Callbacks
	define_model_callbacks :create, :update

	attr_accessor :number_of_floors, :minimum_floor

	def create
		run_callbacks :create do
			puts "in the create"
			self.minimum_floor ||= 1
		end
	end

	def update
		run_callbacks :update do
			puts 'in the update'
		end
	end

end