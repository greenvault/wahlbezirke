class DistrictsController < ApplicationController
  validates_uniqueness_of :district_id

  def index
    @districts = District.all
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

  def show
    @district = District.find(params[:id])
    @municipalities = @district.municipalities
  end

  private

  def district_params
    params.require(:district).permit(:district_id, :state_id)
  end
end
