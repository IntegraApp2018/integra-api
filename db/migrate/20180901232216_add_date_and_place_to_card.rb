class AddDateAndPlaceToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :time, :datetime
    add_column :cards, :location, :string
  end
end
