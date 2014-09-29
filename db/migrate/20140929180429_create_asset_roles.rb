class CreateAssetRoles < ActiveRecord::Migration
  def change
    create_table :asset_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
