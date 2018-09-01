class ChangeCardQuantityOfPeople < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :quantity_of_people, :people_interested
    add_column :cards, :people_needed, :integer
  end
end
