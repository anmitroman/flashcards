class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validate :original_text_equal_translated_text
 
  before_create :add_date
  
  def original_text_equal_translated_text
    if original_text.downcase == translated_text.downcase
      errors.add(:original_text, "can't be equal translated_text")
    end
  end

  private

  def add_date
    self.review_date = Date.today + 3
  end
end
