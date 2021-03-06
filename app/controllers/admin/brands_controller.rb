class Admin::BrandsController < ApplicationController
   before_action :authenticate_admin!

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

  def destroy
    @brand=Brand.find(params[:id])
    @brand.destroy
    redirect_to admin_brands_path
  end

  private
  def brand_params
    params.require(:brand).permit(:brand_name, :brand_status,:tag_list)
  end
end
