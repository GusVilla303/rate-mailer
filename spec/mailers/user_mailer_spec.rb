require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe '#marketing_email' do
    new_rate = 3.55
    let(:user) { mock_model User, email: 'rate-mailer@example.com', rate: 6.38 }
    let(:mail) { UserMailer.marketing_email(user, new_rate) }

    it 'renders the subject' do
      expect(mail.subject).to eql("Rates have dropped by #{user.rate - new_rate} % for you! Refinance today!")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['rate-mailer@example.com'])
    end
  end
end
