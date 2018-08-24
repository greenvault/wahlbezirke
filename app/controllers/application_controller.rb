class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def authenticated_user?
      unless user_signed_in?
        return nil
        # redirect_to login_path, notice: 'Anmeldung erforderlich'
      end
    end

    def active_election?
      unless session[:current_election]
        redirect_to election_path, notice: 'Bitte Wahl auswählen'
      end
    end

    def current_election
      @current_election = Election.find_by_id(session[:current_election_id]) || Election.first
    end
end
