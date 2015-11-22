class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      redirect_to user_url(@user) #show -> users/:id
    else
      flash[:notice] = @user.errors.full_messages
      #flash.now persists errors past one request
      #so must use render, because redirect_to loses info
      render :new
    end
  end

  #sign up page
  def new
    @user = User.new
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
