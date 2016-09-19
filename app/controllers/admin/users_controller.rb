class Admin::UsersController < Admin::BaseController
  # before_action :require_admin
  #
  # def require_admin
  #   if current_default_user? || !logged_in?
  #     render :file => "public/404.html", status: :not_found
  #   else
  #
  #   end
  # end

  def edit
    @user = current_user
  end

  def update
    # security_guard = SecurityGuard.new(user_params)
    # flash! unless security_guard.correct_password?
    # flash2! unless security_guard.new_password_correct?
    # redirect_to admin_dashboard_path if security_guard.security_checks_pass?
    @user = current_user
    @user.update(username: user_params['username'],
                 password: user_params['new_password'])
    redirect_to admin_dashboard_path
    # @user.update_attribute(password:
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :current_password,
                                 :new_password,
                                 :confirm_new_password)
  end
end
