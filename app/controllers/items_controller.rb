class ItemsController < ApplicationController

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

end
