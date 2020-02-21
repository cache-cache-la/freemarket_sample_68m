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
    binding pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
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
