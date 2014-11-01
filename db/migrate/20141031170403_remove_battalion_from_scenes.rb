class RemoveBattalionFromScenes < ActiveRecord::Migration
  def change
  	remove_column :scenes, :battalion, :integer
  end
end
