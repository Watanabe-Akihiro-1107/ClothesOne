class User::BrandsController < ApplicationController
  def index
  	@brands = Brand.select(:brand_name).distinct.order(brand_name: :asc)


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


