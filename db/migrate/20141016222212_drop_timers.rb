class DropTimers < ActiveRecord::Migration
  def change
  	  drop_table :timers
  end
end
