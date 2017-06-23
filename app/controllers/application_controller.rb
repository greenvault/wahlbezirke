class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def authenticated_user?
      unless user_signed_in?
        redirect_to login_path, notice: 'Anmeldung erforderlich'
      end
    end
end
