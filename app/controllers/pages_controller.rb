class PagesController < ApplicationController
  before_action :authenticated_user?, only: [:faq, :choose_election]
  before_action :current_election

  def faq
  end

  def login
  end

  def choose_election
    @elections = Election.all
  end

  def construction
  end
end
