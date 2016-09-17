class OrdersController < ApplicationController
  before_action :require_user

  def require_user
    redirect_to login_path if !logged_in?
  end

  def index
    @orders = current_user.orders
  end

  def create
    @cart = session[:cart]
    @user = current_user
    order_compiler = OrderCompiler.new(@cart, @user)
    order_compiler.populated_item_order
    flash[:success] = "Order was successfully placed."
    redirect_to orders_path
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end
end
