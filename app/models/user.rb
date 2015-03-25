class User < ActiveRecord::Base
  validates :email, presence: true

  def update_rate
    sleep(1.1)
    rand(3..10)
  end

  def rate_qualifies?
    @new_rate   = update_rate
    rate_delta  = (self.rate - new_rate)
    rate_delta >= Deltum.last.rate
  end

  def send_email?
    if self.rate_qualifies?
      EmailWorker.perform_async(self.id, new_rate)
    end
  end

  private

  attr_reader :new_rate
end
