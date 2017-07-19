class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.find_by_emailid(params[:emailid])
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
  def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/my.log")
  end

  def omniauthLogin
    auth = request.env["omniauth.auth"]
    my_logger.info("#{auth.inspect}")
    session[:omniauth] = auth.except('extra')
    user = User.sign_in_from_omniauth(auth)

    session[:user_id] = user.id
    redirect_to posts_url
  end


end
