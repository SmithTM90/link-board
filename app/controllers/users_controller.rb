class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "You are now a user"
    else
      redirect_to new_user_path
      flash[:danger] = "Error occurred, try again"
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
