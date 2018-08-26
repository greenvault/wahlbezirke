class SessionsController < ApplicationController
  def create
    session[:current_election_id] = params['election']
    redirect_to election_index
  end

  private
    def election_index
      if chosen_election.state == 'all'
        states_path
      else
        districts_path
      end
    end

    def chosen_election
      Election.find_by_id(session[:current_election_id]) || Election.first
    end
end
