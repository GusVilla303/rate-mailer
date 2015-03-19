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
end
