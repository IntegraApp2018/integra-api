class Card < ApplicationRecord
  belongs_to :category, optional: true

  before_validation :sanitize_content, :on => :create

  def sanitize_content
    self.description = ActionController::Base.helpers.sanitize(self.description)
  end

end
