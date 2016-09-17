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
    flash[:success] = "Successfully removed #{view_context.link_to(item.title, item_path(item))} from your cart."
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

  # def item_alert_link
  #   item = Item.find(params[:item_id])
  #   "<a href='#{item_path(item)}' class='alert-link'>'#{item.title}'</a>"
  # end

end
