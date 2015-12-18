class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
