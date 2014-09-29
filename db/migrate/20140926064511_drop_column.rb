class DropColumn < ActiveRecord::Migration
  def change
    remove_column :scene_assignments, :incident_id
  end
end
