class UserMailer < ApplicationMailer
  default from: 'rate-mailer@example.com'

  def rate_email(user)
    @user = user
    mail(to: @user.email, subject: "Rates have dropped! Refinance today!")
  end
end
