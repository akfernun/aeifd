class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :apparatus, :arrival_time
  end
end
