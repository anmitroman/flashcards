require 'rails_helper'

RSpec.describe Card, type: :model do
  let!(:card1) { create(:card) }

  context 'when creating or updating card' do
    it 'has a original text' do
      expect(card1.original_text).to eq('sun')
    end

    it 'has not equivalent texts' do
      card2 = build(:card, translated_text: 'sun')
      expect(card2).to_not be_valid
    end

    it 'is not valid without translated_text' do
      card2 = build(:card, translated_text: '')
      expect(card2).to_not be_valid
    end

    it 'has a unique original text' do
      card2 = build(:card, original_text: 'sun')
      expect(card2).to_not be_valid
    end

    it 'is not valid without original_text' do
      card2 = build(:card, original_text: '')
      expect(card2).to_not be_valid
    end

    it 'has review_date = today + 3' do
      expect(card1.review_date).to eq(Date.today + 3)
    end
  end
end
