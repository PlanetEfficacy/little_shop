class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)

    session[:cart] = @cart.contents
    redirect_to items_path
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)
    flash[:success] = "Successfully removed #{item.title} from your cart."
    redirect_to cart_path
  end

  def index
  end

  def edit
  # {"_method"=>"put", "change_quantity"=>"increase", "item_id"=>"6", "controller"=>"carts", "action"
    item = Item.find(params[:item_id])
    if params[:change_quantity] == 'increase'
      @cart.increase_quantity(item.id)
    elsif params[:change_quantity] == 'decrease'
      @cart.decrease_quantity(item.id)
    end
    redirect_to cart_path
  end
end
