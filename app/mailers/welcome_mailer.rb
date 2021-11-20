class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.mailer.subject
  #
  def mailer user
    @user = user
    mail to: @user.email, subject: "Sample Email"
  end
end
