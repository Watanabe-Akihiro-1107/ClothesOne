class User::ItemsController < ApplicationController

  def top
    @categories = Category.all

  end

  def edit
    @item=Item.find(params[:id])
    if current_user.id != @item.user_id
    redirect_to root_path
  end

  end

  def index
    @categories = Category.where(id: 4..23)
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
      brand.brand_name = params[:item][:brand_name]
      brand.save
      @item.brand_name =params[:item][:brand_name]

      

    elsif params[:item][:brand1] == 1.to_s
      # セレクトボックスから選んだBrandの情報で「brand」を定義する
      brand = Brand.find(params[:item][:brand_id])
      @item.brand_name = brand.brand_name
      @item.save!

    end

    if @item.save
      flash[:notice] = "登録が完了しました。"
      redirect_to items_path
    else
      flash.now[:danger] = "登録に失敗しました"
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

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @items = Item.search(params[:search])
    @user=User.find(current_user.id)
  end



  private
  def item_params
    params.require(:item).permit(:item_name, :price, :introduction, :user_id, :brand_id, :category_id, :image, :tag_list,:brand_name)
  end
end
