class AddFloorToSceneAssignments < ActiveRecord::Migration
  def change
    add_column :scene_assignments, :floor, :string
  end
end
