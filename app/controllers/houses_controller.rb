class HousesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
    @reservation = Reservation.new
   
    @markers = [{
      lat: @house.latitude,
      lng: @house.longitude
    }]
  end


  def edit
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    if @house.save
      redirect_to house_path(@house)
    else
      puts @house.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end



  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to  houses_path, status: :see_other
  end


  def update
    @house = House.find(params[:id])
    @house.update(house_params)
    redirect_to house_path(@house)
  end

  private

  def house_params
    params.require(:house).permit(:name, :address, :price_per_night, :number_of_people, :description, photos: [])
  end
end
