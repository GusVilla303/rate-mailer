class UserMailer < ApplicationMailer
  default from: 'rate-mailer@example.com'

  def marketing_email(user, new_rate)
    @user     = user
    @new_rate = new_rate
    mail(to: @user.email,
         subject: "Rates have dropped by #{@user.rate - @new_rate} for you! Refinance today!"
      )
  end
end
