class MunicipalitiesController < ApplicationController
  before_action :authenticated_user?

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
    find_or_redirect
    @precincts = Precinct.where(municipality: @municipality).
      sort_by { |p| p.district_rank }
  end

  private

  def municipality_params
    params.require(:municipality).
      permit(:name, :municipality_identifier, :district_id)
  end

  def find_or_redirect
    unless @municipality = Municipality.
        find_by(municipality_identifier: params[:id])
      redirect_to :root
    end
  end
end
