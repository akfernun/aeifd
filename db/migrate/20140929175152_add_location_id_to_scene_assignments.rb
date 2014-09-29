class AddLocationIdToSceneAssignments < ActiveRecord::Migration
  def change
    add_column :scene_assignments, :location_id, :integer
  end
end
