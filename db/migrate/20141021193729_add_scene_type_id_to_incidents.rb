class AddSceneTypeIdToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :scene_type_id, :integer
  end
end
