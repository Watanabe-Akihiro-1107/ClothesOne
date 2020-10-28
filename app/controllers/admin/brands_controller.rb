class Admin::BrandsController < ApplicationController
  def index
  	@brand = Brand.new
  	@brands = Brand.all

  end

  def create
  	@brand =Brand.new(brand_params)
  	@brand.save
  	redirect_to admin_brands_path
  end

  def edit
  	@brand=Brand.find(params[:id])
  end

  def update
  	@brand=Brand.find(params[:id])
    @brand.update(brand_params)
    redirect_to admin_brands_path
  end

  private
  def brand_params
    params.require(:brand).permit(:brand_name, :brand_status)
  end
end
