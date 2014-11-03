class AddIncidentStrategyIdToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :incident_strategy_id, :integer
  end
end
