class CardsController < ApplicationController
  before_action :get_card, only: [:show, :edit, :update, :destroy]
  def index
    @card = Card.all
  end
  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to @card
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end

  def get_card
    @card = Card.find(params[:id])
  end
end
