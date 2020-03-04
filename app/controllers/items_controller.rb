class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :set_parents

  def index
    @items = Item.includes(:images).order('created_at DESC').limit(3)
    # 仮置きですが、ピックアップはレディース／メンズになっています
    # @pickupladies = Item.includes(:images).where(category: 1..180).order('created_at DESC').limit(3)
    # @pickupmens = Item.includes(:images).where(category: 181..310).order('created_at DESC').limit(3)
  end

  def new
    @item = Item.new
    @item.images.new
    @status_array = Status.all                        # データベースから抽出し、配列化
    @item.build_brand
  end

  # 以下、formatはjsonのみ
  def get_category_children                           # 親カテゴリーが選択された後に動くアクション
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren                      # 子カテゴリーが選択された後に動くアクション
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end



  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "出品しました"
    else
      redirect_to new_item_path, alert: "必須項目を入力してください"
    end
  end

  def show
    redirect_to new_user_session_path unless user_signed_in?
    @comment = Comment.new
    @comments = @item.comments
    @user = User.find_by(id:@item.seller_id)
    @address = Address.find_by(id:@user.id)
  end

  def edit
    @category = @item.category
    @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
    @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")
    @status_array = Status.all
    @item.build_brand
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: "編集しました"
    else
      redirect_to edit_item_path, alert: "必須項目を入力してください"
    end
  end

  def destroy
    if @item.destroy
      render destroypage_items_path
    else
      render :show
    end
  end

  def destroypage
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :status_id, brand_attributes: [:id, :name], images_attributes: [:picture, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
    @images = @item.images
  end

  def set_parents
    @category_parent = Category.where(ancestry: nil)  # データベースから、親カテゴリーのみ抽出し、配列化
  end

end
