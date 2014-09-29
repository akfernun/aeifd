class AddJobIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :job_id, :integer
  end
end
