class MaterialsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @materials = Material.all
    render status: 200, json: @materials.to_json
  end

  def list
    @materials = Material.all.map {|material| {name: material.name, id:material.id} }
    render status: 200, json: @materials
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.create(material_params)
    render status: 200, json: @material.to_json
  end

  def show
    @material = Material.find(params[:id])
    render status: 200, json: @materials.to_json
  end

  private

  def material_params
    params.permit(
      :name,
      :quantity,
      :card_id
    )
  end
  
end
