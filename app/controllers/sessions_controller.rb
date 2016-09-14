class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      # session_evaluator = SessionEvaluator.new(params[:session])
      # redirect_to cart_path if session_evaluator.redirect_to_cart
      # redirect_to dashboard_index_path if session_evaluator.redirect_to_dashboard
      redirect_to dashboard_index_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to items_path
  end
end
