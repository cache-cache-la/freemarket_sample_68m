class CategoriesController < ApplicationController

  def index
    @parents = Category.where(ancestry: nil)
    # @children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
    # @grandchildren = Category.find("#{params[:child_id]}").children

  end

  def show
  end
end
