class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
  end

  def new
    check_user_authorization
    @item = Item.new
    @categories = Category.all
  end

  def create
    redirect_to login_path if current_default_user? || !logged_in?
    @item = Item.new(item_params)
    assign_valid_category_ids(item_params, @item)
    check_if_item_can_be_saved(@item)
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_ids => [] )
  end

  def check_user_authorization
    if !logged_in?
      redirect_to login_path
    elsif current_default_user?
      render :file => "public/404.html", status: :not_found
    end
  end

  def assign_valid_category_ids(item_params, item)
    item_params['category_ids'].reject{ |id| id==''}.each do |id|
      @item.categories << Category.find(id)
    end
  end

  def check_if_item_can_be_saved(item)
    if @item.save
      flash[:success] = "Item was successfully saved."
      redirect_to item_path(@item)
    else
      flash[:danger] = "Item could not be saved."
      redirect_to new_item_path
    end
  end

end
