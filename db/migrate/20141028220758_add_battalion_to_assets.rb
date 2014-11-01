class AddBattalionToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :battalion, :integer
  end
end
