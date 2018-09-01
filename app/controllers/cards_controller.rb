class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @cards = Card.all
    render status: 200, json: @cards.to_json
  end

  def ideas
    @cards = Card.where(is_action:false)
    render status: 200, json: @cards.to_json
  end

  def actions
    @cards = Card.where(is_action:true)
    render status: 200, json: @cards.to_json
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.people_interested = 0
    @card.category = Category.find_by(name:"Outros") if !@card.category
    @card.save
    render status: 200, json: @card.to_json
  end

  def show
    @card = Card.find(params[:id])
    render status: 200, json: @card.to_json
  end

  def add_people
    @card = Card.find(params[:id])
    @card.people_interested += 1
    @card.save
    @card.update_attributes(is_action:true) unless @card.people_interested < @card.people_needed
    render status: 200, json: @card.to_json
  end

  private

  def card_params
    params.permit(:title, :description,:people_interested, :category_id)
  end

end
