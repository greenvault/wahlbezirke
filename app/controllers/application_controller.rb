class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'green', password: 'eiswaffel'
  protect_from_forgery with: :exception
end
