class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user,
                :logged_in?,
                :logged_in_with_cart_items?,
                :cart_empty?

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def current_default_user?
    current_user && !current_user.admin?
  end

  def logged_in?
    !!current_user
  end

  def cart_empty?
    session[:cart] && session[:cart].values.sum == 0
  end

  def logged_in_with_cart_items?
    logged_in? && !cart_empty?
  end

  def require_user
    redirect_to login_path if !logged_in?
  end

  def require_admin
    if current_default_user? || !logged_in?
      render :file => "public/404.html", status: :not_found
    end
  end

end
