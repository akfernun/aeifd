class AddBasementToSceneTypes < ActiveRecord::Migration
  def change
    add_column :scene_types, :floor, :string
    add_column :scene_types, :hasBasement, :boolean
  end
end
