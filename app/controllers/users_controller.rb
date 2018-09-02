class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    render status: 200, json: @user.to_json
  end

  private
  def user_params
    params.permit(:name,:email,:password)
  end
end
