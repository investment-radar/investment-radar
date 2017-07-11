class NoticesMailer < ApplicationMailer
  def notify_to_sell(recipient:, symbol:)
    @recipient = recipient
    @symbol = symbol

    mail to: recipient.email, subject: "It's time to sell: #{symbol}"
  end
end
