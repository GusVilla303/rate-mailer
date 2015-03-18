require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation" do
    it "is invalid if user's email is empty" do
      user = User.new(email: '')

      expect(user).to be_invalid
    end

    it "is invalid if user's email is nil" do
      user = User.new(email: nil)

      expect(user).to be_invalid
    end

    it "is valid if user has an email address" do
      user = User.new(email: 'customer@example.com')

      expect(user).to be_valid
    end
  end

  context "current interest rate" do
    it "is lower than the new (market) rate" do
      user = User.new(email: 'customer@example.com', rate: 4.00)
      new_rate = user.update_rate

      expect(user.rate).to_not eql(new_rate)
      expect(user.rate).to eql(new_rate)  #This lets confirms if my test is actually working

    end
  end
end
