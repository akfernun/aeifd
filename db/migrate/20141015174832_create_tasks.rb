class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :primar_search
      t.boolean :all_clear
      t.boolean :utilities_contacted
      t.boolean :safety_officer_arrived
      t.boolean :utilities_disconnected
      t.boolean :secondary_search
      t.boolean :fire_under_control

      t.timestamps
    end
  end
end
