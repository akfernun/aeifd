class AddTaskIdToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :task_id, :integer
  end
end
