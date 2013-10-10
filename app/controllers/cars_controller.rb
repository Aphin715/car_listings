class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def new
    @car = Car.new
  end

  def index
    @car = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(car_params)

    if @car.save
         redirect_to new_car_path, notice: 'Car recorded.'
    else
      render :new
    end
  end


protected
  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:color, :mileage, :year, :description, :manufacturer_id)
  end
end
