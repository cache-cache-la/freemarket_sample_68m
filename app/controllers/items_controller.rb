class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :show]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
    @brand = Brand.new
    @image = Image.new(item_id: item_id)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    brand_id = Brand.find(@item.id).id             #Brandテーブルのidを取り出す
    status_id = Status.find(@item.id).id           #Statusテーブルのidを取り出す
    category_id = Category.find(@item.id).id       #Categoryテーブルのidを取り出す
    item = Item.find(@item.id)                     #作成したItemのidを取り出す
    #Itemテーブルに"brand_id, status_id, category_id"のカラムを入れる
    item.update(brand_id: brand_id, status_id: status_id, category_id: category_id)
    redirect_to root_path
    else
    redirect_to new_item_path
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, category: [:id], brand: [:id], status: [:id],
      images_attributrs: [:picture, :id]).merge(seller_id: current_user.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else 
      render :show
    end
  end

  private

  def item_params
    
    params.require(:item).permit(:name, :text, :price, :category, :brand, :status, images_attributes: [:picture, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
