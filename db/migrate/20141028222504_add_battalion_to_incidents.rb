class AddBattalionToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :battalion, :integer
  end
end
