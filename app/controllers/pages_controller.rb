class PagesController < ApplicationController
  before_action :authenticated_user?, except: :login

  def faq
  end

  def login
  end

  def choose_election
    @elections = Election.all
  end
end
