class SessionsController < ApplicationController
  def create
    session[:current_election_id] = params['election']
    redirect_to election_index
  end

  private
    def election_index
      if @current_election.state == 'all'
        states_path
      else
        municipalities_path
    end
end
