class PagesController < ApplicationController
  before_action :authenticated_user?, except: :login
  before_action :current_election

  def faq
  end

  def login
  end

  def election_display
    @params = params['election']
  end

  def choose_election
    @elections = Election.all
  end
end
