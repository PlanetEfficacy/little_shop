class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to admin_dashboard_path
      elsif @user.user?
        redirect_to dashboard_path
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to items_path
  end
end
