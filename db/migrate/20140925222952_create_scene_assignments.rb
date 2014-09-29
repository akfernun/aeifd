class CreateSceneAssignments < ActiveRecord::Migration
  def change
    create_table :scene_assignments do |t|
      t.integer :scene_id
      t.integer :asset_id
      t.datetime :arrival_time
      t.string :location

      t.timestamps
    end
  end
end
