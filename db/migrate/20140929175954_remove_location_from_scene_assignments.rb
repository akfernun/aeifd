class RemoveLocationFromSceneAssignments < ActiveRecord::Migration
  def change
    remove_column :scene_assignments, :location
  end
end
