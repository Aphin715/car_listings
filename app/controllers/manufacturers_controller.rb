class ManufacturersController < ApplicationController
  def new
    @manufacturer = Manufacturer.new
  end

  def index
    @manufacturer = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.new(manu_params)

    if @manufacturer.save
         redirect_to new_manufacturer_path, notice: 'Manufacturer recorded.'
    else
      render :new
    end
  end


protected
  def set_car
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manu_params
    params.require(:manufacturer).permit(:country, :name)
  end
end
