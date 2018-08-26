class PrecinctsController < ApplicationController
  before_action :authenticated_user?
  before_action :current_election
end
