class ApplicationMailer < ActionMailer::Base
  default from: 'phamdat.ltd@gmail.com'

  def welcome_email user
    @user = user
    mail to: @user.email, subject: "Sample Email"
  end
end
