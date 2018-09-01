class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @cards = Card.all
    render status: 200, json: @cards.to_json
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.category = Category.find_by(name:"Outros") if !@card.category
    @card.save
    render status: 200, json: @card.to_json
  end

  def show
    @card = Card.find(params[:id])
    render status: 200, json: @cards.to_json
  end

  private

  def card_params
    params.permit(:title, :description,:quantity_of_people, :category_id)
  end

end
