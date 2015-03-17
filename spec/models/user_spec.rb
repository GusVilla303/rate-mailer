require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it "fail if user's email is empty" do
      user = User.new(email: '')

      expect(user).to be_invalid
    end

    it "fail if user's email is nil" do
      user = User.new(email: nil)

      expect(user).to be_invalid
    end

    it "passes if user's email is valid" do
      user = User.new(email: 'customer@example.com')

      expect(user).to be_valid
    end

  end


end
