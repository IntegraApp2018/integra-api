class AddTypeToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :is_action, :boolean, default: false
  end
end
