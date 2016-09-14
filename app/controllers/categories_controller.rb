class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_name(deparameterize(params[:category]))
    @items = @category.items
  end

  private

  def deparameterize(input)
    input.gsub("-"," ")
  end
end
