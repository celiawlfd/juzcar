class HousesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @houses = House.search_by_name_description_and_address(params[:query])
    else
      @houses = House.all
    end
  end

  def show
    @house = House.find(params[:id])
    @reservation = Reservation.new
    @markers = [{
      lat: @house.latitude,
      lng: @house.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { house: @house }),
      marker_html: render_to_string(partial: "marker")
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
