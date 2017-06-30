class RenameColourToColorInProducts < ActiveRecord::Migration[5.1]
  def change
  	rename_column :products, :colour, :color
  end
end
