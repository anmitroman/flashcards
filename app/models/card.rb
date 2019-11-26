class Card < ApplicationRecord
  scope :date_has_expired, -> { where('review_date <= ?', Date.today) }
  scope :random, -> { order(Arel.sql('random()')) }
  validates :translated_text, presence: true
  validates :original_text, uniqueness: true, presence: true
  validate :original_text_equal_translated_text

  before_create :add_date

  def original_text_equal_translated_text
    errors.add(:original_text, "can't be equal translated_text") if original_text.casecmp(translated_text).zero?
  end

  private

  def add_date
    self.review_date = Date.today + 3
  end
end
