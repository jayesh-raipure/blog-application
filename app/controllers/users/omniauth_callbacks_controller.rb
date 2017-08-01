class Users::OmniauthCallbacksController < ApplicationController
  skip_before_filter :authenticate_user!
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    logger.debug("google_oauth2 #{request.env["omniauth.auth"]}")
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => @user.provider) if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
  
  # alias_method :google_oauth2, :all
  # alias_method :facebook, :all
  # alias_method :github, :all
end
