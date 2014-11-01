class AddBattalionToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :battalion_id, :integer
  end
end
