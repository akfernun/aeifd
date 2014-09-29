class AddAssetRoleIdToSceneAssignments < ActiveRecord::Migration
  def change
    add_column :scene_assignments, :asset_role_id, :integer
  end
end
