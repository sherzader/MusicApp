class SessionsController < ApplicationController
  before_action :logged_in?, except: [:destroy]

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      log_in!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = "Invalid credentials"
      redirect_to new_session_url
    end
  end

  def new
    render :new
  end

  def destroy
    log_out! #/session/:id destroy, log out page
    redirect_to new_session_url
  end
end
