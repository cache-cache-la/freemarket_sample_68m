class CategoriesController < ApplicationController
  before_action :set_parents

  def index
  end

  def show
    @items = Item.joins(:categories).where(categories: {id: params[:id]})
    @category = Category.find(params[:id])
    @children = @category.children
    @parent = @category.parent

    # カテゴリーが親要素を持っているか、trueなら親カテゴリーを代入、falseなら上記の@parentをそのまま代入
    if @parent
      @parent = @parent.parent.present? ? @parent.parent : @parent
    end
  end

  private
  def set_parents
    @category_parent = Category.where(ancestry: nil)  # データベースから、親カテゴリーのみ抽出し、配列化
  end

end
