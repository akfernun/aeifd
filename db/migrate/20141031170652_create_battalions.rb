class CreateBattalions < ActiveRecord::Migration
  def change
    create_table :battalions do |t|
      t.string :name

      t.timestamps
    end
  end
end
