Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APPID'], ENV['FACEBOOK_APPSECRET']
  #https://scotch.io/tutorials/integrating-social-login-in-a-ruby-on-rails-application
end