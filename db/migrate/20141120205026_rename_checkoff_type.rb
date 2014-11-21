class RenameCheckoffType < ActiveRecord::Migration
  def change

  	rename_column :checkoffs, :type, :checkofftype
  end
end
