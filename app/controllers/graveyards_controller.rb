class GraveyardsController < ApplicationController
  def index
    @graveyards = Graveyard.all
  end

private

  def graveyards_params
    params.require(:graveyard).permit(:city, :nb_places, :picture_graveyard)
  end

end



