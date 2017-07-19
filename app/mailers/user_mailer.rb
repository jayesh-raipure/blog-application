class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
  def new_user(userinfo)
    @user = userinfo

    mail to: @user.emailid, subject: "BlogApp User Account Created!!!"
  end
end
