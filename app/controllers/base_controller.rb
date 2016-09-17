class BaseController < ActionController::Base
  before_action :require_user

  def require_user
    # redirect_to login_path if !logged_in?
  end
end
