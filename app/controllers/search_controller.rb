class SearchController < ApplicationController
  def index
    render locals: {
      facade: HouseFacade.new(params[:house])
    }
  end
end
