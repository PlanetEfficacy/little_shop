class Admin::DashboardsController < ApplicationController
  before_action :require_admin

  def require_admin
    if current_default_user? || !logged_in?
      render :file => "public/404.html", status: :not_found
    else

    end
  end

  def show
    @user = current_user
    @orders = Order.all
  end
end
