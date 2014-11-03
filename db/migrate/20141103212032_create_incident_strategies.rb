class CreateIncidentStrategies < ActiveRecord::Migration
  def change
    create_table :incident_strategies do |t|
      t.string :name

      t.timestamps
    end
  end
end
