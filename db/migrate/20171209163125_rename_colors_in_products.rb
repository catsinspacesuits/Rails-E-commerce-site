class RenameColorsInProducts < ActiveRecord::Migration[4.2]
  def change
    rename_column :products, :color, :colour
  end
end
