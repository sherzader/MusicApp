class UsersController < ApplicationController

  before_action :user_login!

  def create!
    @user = User.new(user_params)

    if @user.save!
      log_in_user!(@user)
      redirect_to users_url(@user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end

  end

  def new
    @user = User.new
    render :new
  end

  private
  def user_params
    params.require(:users).permit(:email, :password)
  end
end
