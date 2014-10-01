class AddIncidentIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :incident_id, :integer
  end
end
