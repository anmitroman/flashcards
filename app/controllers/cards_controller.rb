# frozen_string_literal: true
# ApplicationController inherits from ActionController::Base, which defines a number of helpful methods

class CardsController < ApplicationController
  def index
    @card = Card.all
  end
end
