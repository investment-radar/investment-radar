# Preview all emails at http://localhost:3000/rails/mailers/notices_mailer
class NoticesMailerPreview < ActionMailer::Preview
  def notify_to_sell
    stock_a = OpenStruct.new bid: "280.50", last_trade_price: "281.55", symbol: "noc", target_price: 281.10, action: "sell"
    stock_b = OpenStruct.new bid: "350.54", last_trade_price: "351.09", symbol: "tsla", target_price: 347.64, action: "hold"

    results = [stock_a, stock_b]

    NoticesMailer.notify_to_sell(email: 'bing708@gmail.com', results: results)
  end
end
