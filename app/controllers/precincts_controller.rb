class PrecinctsController < ApplicationController
  validates_uniqueness_of :precinct_id

  def new
    @precinct = Precinct.new
  end

  def create
    @precinct = Precinct.new(precinct_params)
  end

  private

  def precinct_params
    params.require(:precinct).permit(:precinct_id, :district_score,
                                     :district_rank, :municipality_rank,
                                     :district_id)
  end
end
