class User::ItemsController < ApplicationController

  def top
  end

  def index
    @items=Item.all
  end

  def update
  end

  def create

    @item = Item.new(item_params)
    @item.user_id = current_user.id

    if params[:item][:brand1] == 0.to_s
      brand = Brand.new
      brand.brand_name = @item.brand_name
      brand.save
    end

    if @item.save!
      redirect_to items_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def show
   @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :introduction, :user_id, :brand_id, :category_id, :image, :tag_list,:brand_name)
  end
end
