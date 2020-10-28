class User::BrandsController < ApplicationController
  def index
  	@brand = Brand.new
  	@brands = Brand.all
  end

  def create
    @item =Item.new
    @item.save

  end

  private
  def brand_params
    params.require(:brand).permit(:brand_name, :brand_status)
  end
end
