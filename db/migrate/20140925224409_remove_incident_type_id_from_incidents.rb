class RemoveIncidentTypeIdFromIncidents < ActiveRecord::Migration
  def change
    remove_column :incidents, :incident_type_id
  end
end
