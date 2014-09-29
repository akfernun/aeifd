class CreateSceneTypes < ActiveRecord::Migration
  def change
    create_table :scene_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
