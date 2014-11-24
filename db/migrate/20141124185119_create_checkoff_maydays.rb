class CreateCheckoffMaydays < ActiveRecord::Migration
  def change
    create_table :checkoff_maydays do |t|
      t.integer :mayday_id
      t.integer :checkoff_id
      t.string :status

      t.timestamps
    end
  end
end
