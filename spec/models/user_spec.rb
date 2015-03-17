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
end
