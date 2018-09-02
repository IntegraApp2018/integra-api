class ParticipantsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @participants = Participant.where(card_id:params[:card_id])
    render status: 200, json: @participants.to_json
  end
  def new
    @participant = Participant.new(card_id:params[:card_id])
  end
  def create
    @participant = Participant.create(participant_params)
    render status: 200, json: @participant.to_json
  end
  private
  def participant_params
    params.permit(:card_id,:user_id)
  end
end
