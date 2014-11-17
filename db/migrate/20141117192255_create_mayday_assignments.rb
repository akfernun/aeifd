class CreateMaydayAssignments < ActiveRecord::Migration
  def change
    create_table :mayday_assignments do |t|
      t.integer :mayday_id
      t.integer :asset_id

      t.timestamps
    end
  end
end
