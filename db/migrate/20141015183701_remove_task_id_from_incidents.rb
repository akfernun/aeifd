class RemoveTaskIdFromIncidents < ActiveRecord::Migration
  def change
    remove_column :incidents, :task_id, :integer
  end
end
