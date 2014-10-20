class CreateIncidentAssignments < ActiveRecord::Migration
  def change
    create_table :incident_assignments do |t|
      t.integer :incident_id
      t.integer :location_id
      t.integer :asset_role_id
      t.integer :asset_id

      t.timestamps
    end
  end
end
