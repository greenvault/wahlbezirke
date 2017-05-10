class MunicipalitiesController < ApplicationController
  def index
    @municipalities = Municipality.all
  end

  def new
    @municipality = Municipality.new
  end

  def create
    @municipality = Municipality.new(municipality_params)
  end

  def show
    @municipality = Municipality.find_by(municipality_id: params[:id])
    @precincts = Precinct.where(municipality: @municipality)
  end

  private

  def municipality_params
    params.require(:municipality).permit(:name, :municipality_id, :district_id)
  end
end
