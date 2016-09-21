class Admin::UsersController < Admin::BaseController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(username: user_params['username'],
                 password: user_params['new_password'])
    redirect_to admin_dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :current_password,
                                 :new_password,
                                 :confirm_new_password)
  end
end
