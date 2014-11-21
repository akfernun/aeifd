class CreateCheckoffIncidents < ActiveRecord::Migration
  def change
    create_table :checkoff_incidents do |t|
      t.integer :incident_id
      t.integer :checkoff_id
      t.string :status

      t.timestamps
    end
  end
end
