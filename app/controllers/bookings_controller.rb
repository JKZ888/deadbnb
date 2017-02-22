class BookingsController < ApplicationController
  before_action :find_booking_id, only: [:edit, :update, :destroy]
  before_action :find_tomb_id, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.tomb = @tomb
    if @booking.save
      redirect_to profiles_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @booking.update(booking_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to profiles_path
  end

  private
  def find_booking_id
    @booking = Booking.find(params[:id])
  end

  def find_tomb_id
    @tomb = Tomb.find(params[:tomb_id])
  end



  def booking_params
    params.require(:booking).permit(:duration_years, :nb_persons, :epitaph)
  end
end
