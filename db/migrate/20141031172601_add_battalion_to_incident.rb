class AddBattalionToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :battalion_id, :integer
  end
end
