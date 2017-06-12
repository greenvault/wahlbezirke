class PagesController < ApplicationController
  def faq
    flash[:notice] = "Much faq, very flash"
  end
end
