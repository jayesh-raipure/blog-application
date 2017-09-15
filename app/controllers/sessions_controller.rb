class SessionsController < ApplicationController
  
  skip_before_filter :authenticate_user!
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_url
    else
      redirect_to login_url, notice: "User Name Or Password is not correct."
    end
  end

  def destroy
    session.clear
    redirect_to new_user_session_url, notice: "Logged out"
  end

  def omniauthLogin
    auth = request.env["omniauth.auth"]
    @user = SocialLogin.from_omniauth(auth)
    session[:uid] = @user.uid
    session[:id] = @user.id
    session[:image] = @user.image || "/images/thumb/missing.png"
    session[:name] = @user.firstname
    redirect_to ((request.env['omniauth.origin'] != new_user_session_url) ? request.env['omniauth.origin'] : posts_url)
  end
  
end
