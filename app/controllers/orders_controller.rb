class OrdersController < ApplicationController
  before_action :require_user

  def index
    @orders = current_user.orders
  end

  def create
    OrderCompiler.new(session[:cart], current_user).create
    flash[:success] = "Order was successfully placed."
    redirect_to orders_path
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end
end
