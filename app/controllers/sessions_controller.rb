class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user_authenticated?(user, params)
      set_session(user)
      redirect(user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to items_path
  end

  private

  def redirect(user)
    redirect_to admin_dashboard_path if user.admin?
    redirect_to dashboard_path if user.user?
  end

  def user_authenticated?(user, params)
    user && user.authenticate(params[:session][:password])
  end
end
