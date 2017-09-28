# Preview all emails at http://localhost:3000/rails/mailers/notices_mailer
class NoticesMailerPreview < ActionMailer::Preview
  def notify_to_sell
    NoticesMailer.notify_to_sell(email: 'bing708@gmail.com')
  end
end
