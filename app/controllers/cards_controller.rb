class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @cards = Card.all
    respond_to do |format|
      format.html
      format.json { render json: @cards }
    end
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(
      title: params[:card][:title],
      description: params[:card][:description]
    )
    respond_to do |format|
      format.html {
        redirect_to cards_url unless !@card.save
      }
      format.json {
        render json: @card if @card.save
      }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @card }
    end
  end

end
