class HousesController < ApplicationController

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

  private

  def house_params
    params.require(:house).permit(:name, :address, :price_per_night, :number_of_people, :description)
  end
end
