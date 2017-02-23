class GraveyardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:search_text].blank?
      @graveyards = Graveyard.all
    else
      @graveyards = Graveyard.where( "city ILIKE ?", params[:search_text])
    end
  end

end



