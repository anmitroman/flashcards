require 'rails_helper'

RSpec.describe Card, type: :model do
  let!(:card1) { create(:card) }

  context 'when card has original text' do
    it 'shoud be "sun"' do
      expect(card1.original_text).to eq('sun')
    end
  end

  context 'when translated text is equal original text' do
    it 'should not be valid' do
      card2 = build(:card, translated_text: 'sun')
      expect(card2).to_not be_valid
    end
  end

  context 'when translated text is empty' do
    it 'should not be valid' do
      card2 = build(:card, translated_text: '')
      expect(card2).to_not be_valid
    end
  end

  context 'when creating the second identical card' do
    it 'should not be valid' do
      card2 = build(:card, original_text: 'sun', translated_text: 'солнце')
      expect(card2).to_not be_valid
    end
  end

  context 'when original text is empty' do
    it 'should not be valid' do
      card2 = build(:card, original_text: '')
      expect(card2).to_not be_valid
    end
  end

  context 'when creating new card' do
    it 'must have review_date = today + 3' do
      expect(card1.review_date).to eq(Date.today + 3)
    end
  end
  
end
