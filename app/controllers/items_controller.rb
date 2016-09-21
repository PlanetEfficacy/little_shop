class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
  end

  def new
    if !logged_in?
      redirect_to login_path
    elsif current_default_user?
      render :file => "public/404.html", status: :not_found
    end
    @item = Item.new
    @categories = Category.all
  end

  def create
    redirect_to login_path if current_default_user? || !logged_in?
    @item = Item.new(item_params)
    item_params['category_ids'].reject{ |id| id==''}.each do |id|
      @item.categories << Category.find(id)
    end
    if @item.save
      flash[:success] = "Item was successfully saved."
      redirect_to item_path(@item)
    else
      flash[:danger] = "Item could not be saved."
      redirect_to new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_ids => [] )
  end
end
