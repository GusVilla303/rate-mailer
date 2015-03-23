require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation" do
    it "is invalid if user's email is empty" do
      user = User.create(email: '')

      expect(user).to be_invalid
    end

    it "is invalid if user's email is nil" do
      user = User.create(email: nil)

      expect(user).to be_invalid
    end

    it "is valid if user has an email address" do
      user = User.create!(email: 'customer@example.com')

      expect(user).to be_valid
    end
  end

  context '#update_rate' do
    it "renders a new rate greater than or equal to user rate" do
      user = User.create!(email: 'customer@example.com', rate: 1.00)
      new_rate = user.update_rate

      expect(new_rate).to be >= user.rate
    end

    it "renders a new rate less than or equal to user rate" do
      user = User.create!(email: 'customer@example.com', rate: 10.00)
      new_rate = user.update_rate

      expect(new_rate).to be <= user.rate
    end
  end

  context '#rate_qualifies?' do
    it "will return true if user rate is greater than new rate" do
      user = User.create!(email: 'customer@example.com', rate: 13.00)
      result = user.rate_qualifies?

      expect(result).to eql(true)
    end

    it "will return false if user rate is less than new rate" do
      user = User.create!(email: 'customer@example.com', rate: 0.99)
      result = user.rate_qualifies?

      expect(result).to eql(false)
    end
  end

  context '#send_email?' do
    it "will send a marketing email if difference in rates is greater or equal 'delta'" do
      user = User.create!(email: 'customer@example.com', rate: 13.00)

      expect { user.send_email? }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "will NOT send a marketing email if difference in rates is less than 'delta'" do
      user = User.create!(email: 'customer@example.com', rate: 0.99)

      expect { user.send_email? }.to change { ActionMailer::Base.deliveries.count }.by(0)
    end
  end
end
