namespace :db do
  desc "Populate database with users"
  task  populate: :environment do
    require 'faker'

    100.times do
      user = User.create!(email: Faker::Internet.email,
                          rate:  rand(3..10)
      )
    end
  end
end
