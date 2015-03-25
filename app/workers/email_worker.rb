class EmailWorker
  include Sidekiq::Worker

  def perform(user_id, new_rate)
    user = User.find_by_id(user_id)
    UserMailer.marketing_email(user, new_rate).deliver_now
  end
end
