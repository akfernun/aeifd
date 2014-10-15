class AddIncidentIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :incident_id, :integer
  end
end
