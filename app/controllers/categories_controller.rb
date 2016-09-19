class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_name(deparameterize(params[:category]))
  end

  private

  def deparameterize(input)
    input.gsub("-"," ").split(" ").map{ |word| word.capitalize}.join(' ')
  end
end
