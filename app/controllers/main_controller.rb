class MainController < ApplicationController
  before_action :current_election

  def search
    @states = State.election(@current_election).
      ransack(name_cont: search_params).result(distinct: true)
    @districts = District.election(@current_election).
      ransack(name_cont: search_params).result(distinct: true)
    @municipalities = Municipality.election(@current_election).
      ransack(name_cont: search_params).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @states = @states.limit(3)
        @districts = @districts.limit(6)
        @municipalities = @municipalities.limit(10)
      }
    end
  end

  private

  def search_params
    params[:q].gsub(' ','').gsub(/[^0-9a-z\-üßöäA-ZÜÖÄ ]/i, '')
  end
end
