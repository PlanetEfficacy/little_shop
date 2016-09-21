class OrdersController < ApplicationController
  before_action :require_user
  before_action :require_admin, only: [:update]

  def index
    @orders = current_user.orders
  end

  def create
    if !session[:cart].empty?
      order_compiler = OrderCompiler.new(session[:cart], current_user)
      order_compiler.generate
      order_compiler.calculate_order_total
      flash[:success] = "Order was successfully placed."
      session[:cart].clear
      redirect_to orders_path
    elsif session[:cart].empty?
      flash[:danger] = "This order has already been placed. Your cart is empty."
      redirect_to orders_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.ordered? || @order.paid?
      status = params[:status]
      @order.update(status: status)
      flash[:warning] = "Order no.#{@order.id} is now #{status}"
      if status == "cancelled"
        redirect_to admin_orders_cancelled_path(:status => 2)
      elsif status == "paid"
        redirect_to admin_orders_paid_path(:status => 1)
      elsif status == "completed"
        redirect_to admin_orders_completed_path(:status => 3)
      end
    end
  end

end
