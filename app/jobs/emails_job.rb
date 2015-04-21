class EmailsJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    user_id  = args[0]
    new_rate = args[1]
    user = User.find_by_id(user_id)
    UserMailer.marketing_email(user, new_rate).deliver_now
  end
end
