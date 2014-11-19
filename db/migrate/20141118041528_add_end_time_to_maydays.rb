class AddEndTimeToMaydays < ActiveRecord::Migration
  def change
    add_column :maydays, :end_time, :datetime
  end
end
