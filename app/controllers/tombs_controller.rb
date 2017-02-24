class TombsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @graveyard = Graveyard.find(params[:graveyard_id])
    @tombs = @graveyard.tombs
  end

  def new
    @graveyards = Graveyard.all
    @tomb = Tomb.new
  end

  def create

    ## 1
    # @tomb = Tomb.new(tomb_params)
    # @tomb.owner = current_user

    ## 2
    @tomb = current_user.my_tombs.new(tomb_params)


    # ap current_user.my_tombs.new


    if @tomb.save
      redirect_to profiles_path
    else
      render :new
    end
  end

  def edit
    @graveyard = Graveyard.all
    @tomb = Tomb.find(params[:id])
  end

  def update
    @tomb = Tomb.find(params[:id])
    if @tomb.update(tomb_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  def destroy
    @tomb = Tomb.find(params[:id])
    if @tomb.bookings.any?
      flash[:notice] = "impossible to destroy this tomb because it has been booked"
    else
      @tomb.destroy
    end
     redirect_to profiles_path
  end

  private

  def tomb_params
    params.require(:tomb).permit(:price, :description, :name_tomb, :picture_tomb, :graveyard_id)
  end

end
