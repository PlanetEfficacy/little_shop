class DashboardsController < ApplicationController
  before_action :require_user

  def show
    @user = User.find(session[:user_id])
  end

  def require_user
    redirect_to login_path if !logged_in?
  end
end
