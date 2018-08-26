class StatesController < ApplicationController
  before_action :authenticated_user?
  before_action :current_election

  def index
    @states = State.all.order 'name ASC'
  end

  def show
    @state = State.find(params[:id])
    @districts = District.election(@current_election).where(state: @state).
      sort_by { |d| d.district_identifier.to_i }
  end

end
