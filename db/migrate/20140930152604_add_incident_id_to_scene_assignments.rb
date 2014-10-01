class AddIncidentIdToSceneAssignments < ActiveRecord::Migration
  def change
    add_column :scene_assignments, :incident_id, :integer
  end
end
