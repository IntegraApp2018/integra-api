class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if params[:category_id]
      @cards = Card.where(category_id:params[:category_id])
    else
      @cards = Card.all
    end
    render status: 200
  end

  def ideas
    @cards = Card.where(is_action:false)
    render status: 200
  end

  def actions
    @cards = Card.where(is_action:true)
    render status: 200
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.people_interested = 0
    @card.category = Category.find_by(name:"Outros") if !@card.category
    @card.save
    material = Material.new(
      name: params[:material_name],
      quantity_needed: params[:material_quantity],
      card_id: @card.id
    )
    @card.materials << material unless material.save
    render "show"
  end

  def show
    @card = Card.find(params[:id])
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
    params.permit(
      :title,
      :description,
      :people_interested,
      :category_id,
      :people_needed,
      :time,
      :location,
      :owner_id,
      materials_attributes: [:name, :quantity, :id]
    )
  end

end
