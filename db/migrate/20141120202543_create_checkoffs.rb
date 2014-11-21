class CreateCheckoffs < ActiveRecord::Migration
  def change
    create_table :checkoffs do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
