class DistrictsController < ApplicationController
  before_action :authenticated_user?
  before_action :current_election
    @districts = District.all

  def index
  end

  def show
    @district = District.find_by(district_identifier: params[:id],
                                election: current_election)
    if params['gemeinde'] == '1'
      @municipalities = Municipality.where(district: @district,
                                          election: current_election).
        sort_alphabetical_by(&:name)
      render 'show_municipalities'
    else
      @precincts = Precinct.where(district: @district,
                                  election: current_election).
        sort_by { |p| p.district_rank }
    end
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(district_params)
    if @district.save
      flash[:success] = "District created"
      redirect_to @district
    else
      render 'new'
    end
  end

  private

  def district_params
    params.require(:district).permit(:district_identifier, :state_id, :election_id)
  end
end
