class PagesController < ApplicationController
  def index
    @card = Card.date_has_expired.random.first
  end
end
