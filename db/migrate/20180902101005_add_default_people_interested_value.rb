class AddDefaultPeopleInterestedValue < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :people_interested, :integer, default: 0
  end
end
