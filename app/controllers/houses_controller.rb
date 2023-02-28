class HousesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])

  def edit
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to house_path(@house)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    @house = House.find(params[:id])
    @house.update(house_params)
    redirect_to house_path(@house)
  end

  private

  def house_params
    params.require(:house).permit(:name, :address, :price_per_night, :number_of_people, :description)
  end
end
