class RenameMaterialQuantity < ActiveRecord::Migration[5.2]
  def change
    rename_column :materials, :quantity, :quantity_needed
    add_column :materials, :current_quantity, :integer, default: 0
  end
end
