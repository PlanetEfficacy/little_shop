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
end
