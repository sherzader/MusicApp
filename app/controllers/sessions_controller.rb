class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      render :new
    else
      log_in!(user)
      redirect_to user_url(user)
    end
  end

  def new
  end

  def destroy
    log_out! #/session/:id destroy, log out page
    redirect_to new_session_url
  end
end
