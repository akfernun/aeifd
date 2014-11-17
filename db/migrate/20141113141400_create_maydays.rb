class CreateMaydays < ActiveRecord::Migration
  def change
    create_table :maydays do |t|
      t.integer :incident_assignment_id

      t.timestamps
    end
  end
end
