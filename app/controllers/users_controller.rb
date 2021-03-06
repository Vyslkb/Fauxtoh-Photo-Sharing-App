class UsersController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "Thanks for signing up!"
    redirect_to root_url
  else
    render new_user_path
  end
end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end
end
