class Card < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :owner, foreign_key: "owner_id", class_name: "User", optional: true
  has_many :participants, foreign_key: "card_id", class_name: "Participant"
  has_many :materials

  before_validation :sanitize_content, :on => :create

  def sanitize_content
    self.description = ActionController::Base.helpers.sanitize(self.description)
  end

end
