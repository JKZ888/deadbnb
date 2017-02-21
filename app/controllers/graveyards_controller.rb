class GraveyardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @graveyards = Graveyard.all
  end

end



