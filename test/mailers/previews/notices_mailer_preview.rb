# Preview all emails at http://localhost:3000/rails/mailers/notices_mailer
class NoticesMailerPreview < ActionMailer::Preview
  User = Struct.new(:email, :name)

  def notify_to_sell
    user = User.new('bing708@gmail.com', 'Xie Bing')

    NoticesMailer.notify_to_sell(recipient: user, symbol: 'APPL')
  end
end
