class AddIncidentStrategyIdScenes < ActiveRecord::Migration
  def change
  	add_column :scenes, :incident_strategy_id, :integer
  end
end
