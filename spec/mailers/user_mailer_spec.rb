require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe '#rate_email' do
    let(:user) { mock_model User, email: 'rate-mailer@example.com' }
    let(:mail) { UserMailer.rate_email(user) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Rates have dropped! Refinance today!')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['rate-mailer@example.com'])
    end
  end
end
