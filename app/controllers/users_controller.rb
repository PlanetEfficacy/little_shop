class UsersController < ApplicationController
  helper_method :us_states
  include StateHelper

  def new
    @user = User.new
    @user_profile = UserProfile.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.user_profile = UserProfile.create(user_profile_params)
      set_session(@user)
      redirect_to dashboard_path
    else
      flash[:danger] = "Please re-enter your password"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def us_states
    state_options
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name, :street_address, :city, :state, :zipcode)
  end
end
