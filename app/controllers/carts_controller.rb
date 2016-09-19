class CartsController < ApplicationController
  def item
    Item.find(params[:item_id])
  end

  def create
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to items_path
  end

  def destroy
    @cart.remove_item(item.id)
    flash[:success] = "Successfully removed #{view_context.link_to(item.title, item_path(item))} from your cart."
    redirect_to cart_path
  end

  def index
  end

  def edit
    if user_clicked_increase?
      @cart.increase_quantity(item.id)
    elsif user_clicked_decrease?
      @cart.decrease_quantity(item.id)
    end
    redirect_to cart_path
  end

  private

  def user_clicked_increase?
    params[:change_quantity] == 'increase'
  end

  def user_clicked_decrease?
    params[:change_quantity] == 'decrease'
  end
end
