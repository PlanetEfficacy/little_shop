class Admin::DashboardsController < Admin::BaseController
  helper_method :can_be_cancelled?

  def show
    @user = current_user
    @orders = Order.all
  end

  def can_be_cancelled?(order)
   (order.status == "paid" || order.status == "ordered") && !order.cancelled?
  end

end
