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

  def update
    @house = House.find(params[:id])
    @house.update(house_params)
    redirect_to house_path(@house)

  end
end
