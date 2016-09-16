class Admin::DashboardsController < ApplicationController
  before_action :require_admin

  def require_admin
    if current_default_user?
      render :file => "public/404.html", status: :not_found
    elsif !logged_in?

    else

    end
  end
end
