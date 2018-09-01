class AddFieldsToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :quantity_of_people, :integer
  end
end
