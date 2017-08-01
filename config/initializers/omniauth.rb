OmniAuth.config.logger = Rails.logger if Rails.env.development?

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APPID'], ENV['FACEBOOK_APPSECRET']
  provider :github, ENV['GITHUB_CID'], ENV['GITHUB_CSECRET']
  provider :google_oauth2, ENV['GMAIL_CID'], ENV['GMAIL_CSECRET']
  #https://scotch.io/tutorials/integrating-social-login-in-a-ruby-on-rails-application
end