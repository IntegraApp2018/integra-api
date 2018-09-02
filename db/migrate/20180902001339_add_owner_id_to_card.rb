class AddOwnerIdToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :owner_id, :integer
  end
end
