class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end

  def create
    # cart = session[:cart]
    #basically want the Order object to possibly be initialized with the cart contents?
  end
end
