class AddFloorToIncidentAssignments < ActiveRecord::Migration
  def change
    add_column :incident_assignments, :floor, :string
  end
end
