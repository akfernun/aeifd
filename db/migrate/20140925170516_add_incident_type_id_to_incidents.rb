class AddIncidentTypeIdToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :incident_type_id, :integer
  end
end
