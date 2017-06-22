class PagesController < ApplicationController
  before_action :authenticated_user?, except: :login

  def faq
  end

  def login
  end
end
