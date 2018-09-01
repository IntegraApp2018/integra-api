class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.column :title, :string
      t.column :description, :text
      t.timestamps
    end
  end
end
