class AddCategoryIdToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :category_id, :integer
  end
end
