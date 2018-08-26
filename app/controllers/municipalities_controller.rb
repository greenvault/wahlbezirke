class MunicipalitiesController < ApplicationController
  before_action :authenticated_user?
  before_action :current_election

  def index
    @municipalities = Municipality.election(@current_election).all
  end

  def show
    find_or_redirect
    if @current_election.state == 'he'
      @precincts = Precinct.election(@current_election).
        where(municipality: @municipality).
        sort_by { |p| p.district_score }.reverse!
      render 'show_ltwh_municipality'
    elsif @current_election.state == 'by'
      @precincts = Precinct.election(@current_election).
        where(municipality: @municipality).
        sort_by { |p| p.district_score }.reverse!
      render 'show_ltwb_municipality'
    else
      @precincts = Precinct.election(@current_election).
        where(municipality: @municipality).sort_by { |p| p.district_rank }
    end
  end

  private

  def find_or_redirect
    unless @municipality = Municipality.election(@current_election).
        find_by(municipality_identifier: params[:id])
      redirect_to :root
    end
  end
end
