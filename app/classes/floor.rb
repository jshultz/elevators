class Floor
	include ActiveModel::Model

	attr_accessor :number_of_floors, :minimum_floor

	before_save :default_values

	def default_values
		self.minimum_floor ||= 1
	end

end