class User::ItemsController < ApplicationController

  def top
    @inquiry = Inquiry.new

  end

  def edit
    @item=Item.find(params[:id])
    if current_user.id != @item.user_id
    redirect_to root_path
  end
  end

  def index
      @categories = Category.where(id:1..3)
    # urlにcategory_id(params)がある場合
    if params[:category_id]
      @category = Category.find(params[:category_id])
      if @category.id == 2
        @items =Item.where(category_id:13..20).order(created_at: :desc)
        @categories = Category.where(id:13..20)
      elsif @category.id == 1
        @items =Item.where(category_id:4..12).order(created_at: :desc)
        @categories = Category.where(id:4..12)
      elsif @category.id == 3
        @items =Item.where(category_id:21..23).order(created_at: :desc)
        @categories = Category.where(id:21..23)
      elsif
        @category.id == 13 || @category.id == 14 || @category.id == 15 ||
        @category.id == 16 || @category.id == 17 || @category.id == 18 ||
        @category.id == 19 || @category.id == 20 || @category.id == 21 ||
        @category.id == 22 || @category.id == 23 ||
        @items = Item.where(category_id: @category.id).order(created_at: :desc)
        @categories = Category.where(id:13..20)
        @items =Item.where(category_id: @category.id).order(created_at: :desc)
      elsif
        @category.id == 4 || @category.id == 5 || @category.id == 6 ||
        @category.id == 7 || @category.id == 8 || @category.id == 9 ||
        @category.id == 10 || @category.id == 11 || @category.id == 12
        @items = Item.where(category_id: @category.id).order(created_at: :desc)
        @categories = Category.where(id:4..12)
      elsif
        @category.id ==21 || @category.id == 22 || @category.id == 23
        @items = Item.where(category_id: @category.id).order(created_at: :desc)
        @categories = Category.where(id:21..23)
      else
        @category = Category.find(params[:category_id])
        @items = Item.where(category_id: @category.id).order(created_at: :desc)
      end
    elsif params[:brand_name]
      @brand = Brand.find_by(brand_name: params[:brand_name])
      @items = Item.where(brand_name: @brand.brand_name).order(created_at: :desc)
      @brandname = params[:brand_name]
    else
      # 投稿すべてを取得
      @items = Item.all.order(created_at: :desc).order(created_at: :desc)
    end
  end


  def update
    @item =Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item.id)
  end


  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:notice] = "投稿しました"
      redirect_to items_path
    else
        render :new
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
    @user = @item.user
  end

  def new
    @item = Item.new
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @items = Item.search(params[:search])
    @categories = Category.where(id:1..3)
  end



  private
  def item_params
    params.require(:item).permit(:item_name, :price, :introduction, :user_id, :brand_id, :category_id, :image, :tag_list,:brand_name)
  end
end
