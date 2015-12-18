class Elevator
	include ActiveModel::Model

	attr_accessor :current_floor, :passengers, :emtpy, :trips

  def self.bar
    puts 'class method'
  end
  
  def baz
    puts 'instance method'
  end
end