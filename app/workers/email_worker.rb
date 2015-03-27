class EmailWorker
  include Sidekiq::Worker

  def perform(user_id, new_rate)
    user = User.find_by_id(user_id)
    UUserMailer.marketing_email(user, new_rate).deliver_now
  end
end
