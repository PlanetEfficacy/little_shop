class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:categories])
    @items = @category.items
  end
end
