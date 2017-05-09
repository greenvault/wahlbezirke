class MunicipalitiesController < ApplicationController
  validates_uniqueness_of :municipality_id

  def index
    @municipalities = Municipality.all
  end

  def new
    @municipality = Municipality.new
  end

  def create
    @municipality = Municipality.new(municipality_params)
  end

  private

  def municipality_params
    params.require(:municipality).permit(:name, :municipality_id, :district_id)
  end
end
