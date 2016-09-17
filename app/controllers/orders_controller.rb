class OrdersController < ApplicationController
  before_action :require_user

  def require_user
    redirect_to login_path if !logged_in?
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items
  end

  def create
  end
end
