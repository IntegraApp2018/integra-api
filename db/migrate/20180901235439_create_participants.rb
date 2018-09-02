class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.integer :card_id
      t.integer :user_id
    end
  end
end
