class User < ActiveRecord::Base
  validates :email, presence: true

  SET_DELTA = 2.00

  def update_rate
    sleep(1.1)
    rand(1..10)
  end

  def send_email?
    new_rate    = (update_rate)
    rate_delta  = (self.rate - new_rate)
    rate_delta >= SET_DELTA
  end

  def deliver_email
    if self.send_email?
      UserMailer.rate_email(self).deliver_now
    end
  end

end
