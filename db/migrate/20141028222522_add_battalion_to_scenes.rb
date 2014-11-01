class AddBattalionToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :battalion, :integer
  end
end
