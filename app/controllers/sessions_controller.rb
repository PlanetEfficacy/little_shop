class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      # this_new_class_we_are_about_create = Class.new(session)
      # redirect_to this_new_class_we_are_about_create.redirect
      # session = this_new_class_we_are_about_create.session
      session[:user_id] = @user.id
      redirect_to items_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to items_path
  end
end
