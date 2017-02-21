class ProfilesController < ApplicationController

  def index
    @tombs = current_user.my_tombs
    @bookings = current_user.bookings
  end

end
