class Admin::DashboardsController < Admin::BaseController
  # before_action :require_admin
  helper_method :can_be_cancelled?

  # def require_admin
  #   if current_default_user? || !logged_in?
  #     render :file => "public/404.html", status: :not_found
  #   else
  #
  #   end
  # end

  def show
    @user = current_user
    @orders = Order.all
  end

  def can_be_cancelled?(order)
   order.status == "paid" || order.status == "ordered"
  end

end
