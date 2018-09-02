class User < ApplicationRecord
  has_many :owned_cards, foreign_key: "owner_id", class_name: "Card"
  has_many :joined_cards, foreign_key: "user_id", class_name: "Participant"
end
