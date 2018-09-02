class ChangeCardQuantityOfPeople < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :quantity_of_people, :people_interested, default: 0
    add_column :cards, :people_needed, :integer, default: 0
  end
end
