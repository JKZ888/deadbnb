class GraveyardsController < ApplicationController
  def index
    @graveyards = Graveyard.all
  end

end



