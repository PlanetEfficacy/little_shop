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
    #need to make item.title into a link
    # flash[:success] = "Successfully removed #{view_context.link_to('item.title', item_path(item))} from your cart.".html_safe
    flash[:success] = "Successfully removed #{item.title} from your cart.".html_safe
    redirect_to cart_path
  end


  def index

  end

  # def item_alert_link
  #   item = Item.find(params[:item_id])
  #   "<a href='#{item_path(item)}' class='alert-link'>'#{item.title}'</a>"
  # end

end
