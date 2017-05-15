class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end

  def show
    @district = District.find_by(district_id: params[:id])
    @municipalities = Municipality.where(district: @district).
      sort_alphabetical_by(&:name)
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
    params.require(:district).permit(:district_id, :state_id)
  end
end
