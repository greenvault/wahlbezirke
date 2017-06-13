class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :trigger_flash

  def trigger_flash
    if params[:flash] == '1'
      flash.now[:notice] = "Much faq, very flash"
    end
  end
end
