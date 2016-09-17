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
    order_compiler = OrderCompiler.new(@cart, @user)
  end
end
