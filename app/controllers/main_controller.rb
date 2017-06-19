class MainController < ApplicationController
  def search
    @states = State.ransack(name_cont: params[:q]).result(distinct: true).limit(4)
    @districts = District.ransack(name_cont: params[:q]).result(distinct: true).limit(4)
    @municipalities = Municipality.ransack(name_cont: params[:q]).result(distinct: true).limit(4)

    respond_to |format|

  end
end
