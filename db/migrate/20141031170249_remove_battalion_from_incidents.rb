class RemoveBattalionFromIncidents < ActiveRecord::Migration
  def change
  	remove_column :incidents, :battalion, :integer

  end
end
