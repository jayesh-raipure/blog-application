Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1695758094062863", "d22ac33665be625f951cec4c4bd01b01"
  #https://scotch.io/tutorials/integrating-social-login-in-a-ruby-on-rails-application
end