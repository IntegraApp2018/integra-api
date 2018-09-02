class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.column :name, :string
      t.integer :quantity
      t.timestamps
    end
  end
end
