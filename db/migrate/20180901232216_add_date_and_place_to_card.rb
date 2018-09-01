class AddDateAndPlaceToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :time, :datetime
  end
end
