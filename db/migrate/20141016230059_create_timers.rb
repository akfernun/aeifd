class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.datetime :primary_search
      t.datetime :all_clear
      t.datetime :utilities_contacted
      t.datetime :safety_officer_arrived
      t.datetime :utilities_disconnected
      t.datetime :secondary_search
      t.datetime :fire_under_control
      t.integer :incident_id

      t.timestamps
    end
  end
end
