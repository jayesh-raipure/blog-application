class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_url
    else
      redirect_to login_url, notice: "User Name Or Password is not correct."
    end
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to login_url, notice: "Logged out"
  end

  def omniauthLogin
    auth = request.env["omniauth.auth"]
    logger.debug "#{auth.inspect}"
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)

    session[:user_id] = user.id
    redirect_to posts_url
  end
  
end
