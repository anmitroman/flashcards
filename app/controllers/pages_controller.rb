class PagesController < ApplicationController
  def index
    @card = Card.date_has_expired.sample(1).first
  end
end
