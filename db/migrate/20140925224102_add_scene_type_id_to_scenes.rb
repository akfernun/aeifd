class AddSceneTypeIdToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :scene_type_id, :integer
  end
end
