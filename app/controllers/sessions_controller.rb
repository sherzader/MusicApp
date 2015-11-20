class SessionsController < ApplicationController
  before_action :already_logged_in, except: [:destroy]

  def create!
    user = User.find_by_credentials(session_params)

    if user.nil?
      flash.now[:errors] = "Invalid credentials"
      render :new
    else
      log_in!
      redirect_to users_url(user)
    end
  end

  def new
    render :new
  end

  def destroy
    log_out! #/session/:id destroy, log out page
    redirect_to new_sessions_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
