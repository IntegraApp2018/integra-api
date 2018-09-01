class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    Card.create(
      title: params[:card][:title],
      description: params[:card][:description]
    )
    redirect_to cards_url
  end

end
