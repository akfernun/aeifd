class AddCodeToMaydays < ActiveRecord::Migration
  def change
    add_column :maydays, :code, :string
  end
end
