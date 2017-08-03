class NoticesMailer < ApplicationMailer
  def notify_to_sell(email:, symbol:)
    @symbol = symbol

    mail to: email, subject: "It's time to sell: #{symbol}"
  end
end
