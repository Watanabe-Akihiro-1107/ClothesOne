class User::ItemsController < ApplicationController

  def top
    @categories = Category.all

  end

  def index
    @categories = Category.all
    @items=Item.all

    # urlにcategory_id(params)がある場合
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
      # category_idと紐づく投稿を取得
      @items = @category.items.order(created_at: :desc).all
    else
      # 投稿すべてを取得
      @items = Item.order(created_at: :desc).all
      end
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
      
    elsif params[:item][:brand1] == 1.to_s
      @item.brand_name = params[:item][:brand_name]
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
    @categories = Category.all
    @item = Item.find(params[:id])
    @item_comment=ItemComment.new
  end

  def new
    @item = Item.new
  end



  private
  def item_params
    params.require(:item).permit(:item_name, :price, :introduction, :user_id, :brand_id, :category_id, :image, :tag_list,:brand_name)
  end
end
