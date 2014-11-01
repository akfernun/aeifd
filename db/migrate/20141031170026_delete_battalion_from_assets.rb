class DeleteBattalionFromAssets < ActiveRecord::Migration
  def change
  	    remove_column :assets, :battalion, :integer
  end
end
