class StatesController < ApplicationController
  def index
    @states = State.all.order 'name ASC'
  end

  def show
    @state = State.find(params[:id])
    @districts = District.where(state: @state).sort_by { |d| d.district_id.to_i }
  end

end
