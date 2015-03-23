class User < ActiveRecord::Base
  validates :email, presence: true


  SET_DELTA = 2.00

  def update_rate
    sleep(1.1)
    rand(3..10)
  end

  def rate_qualifies?
    @new_rate   = update_rate
    rate_delta  = (self.rate - new_rate)
    rate_delta >= SET_DELTA              #Delta.last.rate
  end

  def send_email?
    if self.rate_qualifies?
      UserMailer.marketing_email(self, new_rate).deliver_now
    end
  end

  private

  attr_reader :new_rate
end
