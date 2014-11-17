class AddNameToMaydays < ActiveRecord::Migration
  def change
    add_column :maydays, :name, :string
  end
end
