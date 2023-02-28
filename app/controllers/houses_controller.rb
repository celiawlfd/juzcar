class HousesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @houses = House.all
    @houses = policy_scope(House)
  end

  def show
    @house = House.find(params[:id])
    authorize @house
  end

  def edit
    @house = House.find(params[:id])
    authorize @house
  end

  def new
    @house = House.new
    authorize @house
  end

  def create
    @house = House.new(house_params)
    @house.user = current_user
    authorize @house

    if @house.save
      redirect_to house_path(@house)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy
    redirect_to houses_path, status: :see_other
    authorize @house
  end

  def update
    @house = House.find(params[:id])
    @house.update(house_params)
    redirect_to house_path(@house)
    authorize @house
  end

  private

  def house_params
    params.require(:house).permit(:name, :address, :price_per_night, :number_of_people, :description)
  end
end
