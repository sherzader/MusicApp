class UsersController < ApplicationController
  before_action :already_logged_in, except: [:show]

  #upon clicking submit in new.html.erb
  def create
    @user = User.new(user_params)

    if @user.save!
      log_in!(@user)
      #loses information
      redirect_to user_url(@user) #show users/:id
    else
      flash.now[:errors] = user.errors.full_messages
      #saves information
      render :new
    end
  end

  #sign up page
  def new
    @user = User.new
    render :new
  end

  def show
    #goes to user's show view
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
