class CategoriesController < ApplicationController
  before_action :set_parents

  def index
  end

  def show
    @items = Item.joins(:categories).where(categories: {id: params[:id]})
    @category = Category.find(params[:id])
  end

  private
  def set_parents
    @category_parent = Category.where(ancestry: nil)  # データベースから、親カテゴリーのみ抽出し、配列化
  end

end
