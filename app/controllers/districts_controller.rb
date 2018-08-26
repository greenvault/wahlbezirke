class DistrictsController < ApplicationController
  before_action :authenticated_user?
  before_action :current_election

  def index
    @districts = District.election(@current_election).
      sort_by { |d| d.district_identifier.split(' ').map(&:to_i) }
  end

  def show
    if @current_election.state == 'he'
      @district = District.election(@current_election).
        find_by(district_identifier: params[:id])
      if params['gemeinde'] == '1'
        @municipalities = Municipality.election(@current_election).
          where(district: @district).sort_alphabetical_by(&:name)
        render 'show_ltwh_municipalities'
      else
        @precincts = Precinct.election(@current_election).
          where(district: @district).sort_by { |p| p.district_score }
        render 'show_ltwh'
      end
    else
      @district = District.election(@current_election).
        find_by(district_identifier: params[:id])
      if params['gemeinde'] == '1'
        @municipalities = Municipality.election(@current_election).
          where(district: @district).sort_alphabetical_by(&:name)
        render 'show_municipalities'
      else
        @precincts = Precinct.election(@current_election).
          where(district: @district).sort_by { |p| p.district_rank }
      end
    end
  end
end
