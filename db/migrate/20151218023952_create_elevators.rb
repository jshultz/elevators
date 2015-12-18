class CreateElevators < ActiveRecord::Migration
  def change
    create_table :elevators do |t|
      t.integer :current_floor
      t.integer :destination
      t.integer :passengers
      t.boolean :empty
      t.integer :trips
      t.string :door_status

      t.timestamps null: false
    end
  end
end
