class OrdersController < ApplicationController
  before_action :require_user

  def index
    @orders = current_user.orders
  end

  def create
    order_compiler = OrderCompiler.new(session[:cart], current_user)
    order_compiler.generate
    order_compiler.calculate_order_total
    flash[:success] = "Order was successfully placed."
    redirect_to orders_path
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end
end
