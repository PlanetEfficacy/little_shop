class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    # require "pry"; binding.pry
    # params['item']['category_ids'].each do |id|
    item_params['category_ids'].reject{ |id| id==''}.each do |id|
      @item.categories << Category.find(id)
    end
    if @item.save
      flash[:success] = "Item was successfully saved."
      redirect_to item_path(@item)
    else
      flash[:danger] = "Item could not be saved."
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url, :category_ids => [] )
  end
end
