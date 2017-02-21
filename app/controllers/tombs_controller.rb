class TombsController < ApplicationController

  def new
    @tomb = Tomb.new
  end

  def create
    @tomb = Tomb.new(tomb_params)
    if @tomb.save
      redirect_to graveyards_path
    else
      render :new
    end
  end

  def edit
    @tomb = Tomb.find(params[:id])
  end

  def update
    if @tomb.update(tomb_params)
      redirect_to graveyards_path
    else
      render :edit
    end
  end

  def delete
    @tomb.destroy
    redirect_to graveyards_path
  end

  private

  def tomb_params
    params.require(:tomb).permit(:price, :description, :name_tomb, :picture_tomb)
  end

end
