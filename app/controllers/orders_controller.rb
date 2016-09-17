class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end

  def create
    @cart = session[:cart]
    @user = current_user
    OrderCompiler.new(@cart, @user)
    flash[:success] = "Order was successfully placed."
    redirect_to orders_path
  end
end
