class MunicipalitiesController < ApplicationController
  def index
    @municipalities = Municipality.all

  end
end
