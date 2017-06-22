class DistrictsController < ApplicationController
  before_action :authenticated_user?

  def index
    @districts = District.all
  end

  def show
    @district = District.find_by(district_identifier: params[:id])
    if params['gemeinde'] == '1'
      @municipalities = Municipality.where(district: @district).
        sort_alphabetical_by(&:name)
      render 'show_municipality'
    else
      @precincts = Precinct.where(district: @district).
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
    params.require(:district).permit(:district_identifier, :state_id)
  end
end
