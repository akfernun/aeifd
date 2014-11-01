class AddBattalionToScene < ActiveRecord::Migration
  def change
    add_column :scenes, :battalion_id, :integer
  end
end
