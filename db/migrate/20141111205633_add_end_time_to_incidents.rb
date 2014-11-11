class AddEndTimeToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :end_time, :datetime
  end
end
