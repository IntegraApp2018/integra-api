class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    render status: 200, json: @user.to_json
  end

  def owned_cards
    @cards = Card.where(owner_id:params[:user_id])
  end

  def joined_cards
    @cards = Card.joins(:participants).where(participants:{ user_id: params[:user_id] })
  end

  private
  def user_params
    params.permit(:name,:email,:password,:phone)
  end
end
