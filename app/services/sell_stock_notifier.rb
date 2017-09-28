class SellStockNotifier
  include Concerns::Service

  def call
    long_term_stocks = LongTermStock.all
    email = 'bing708@gmail.com'

    StockService.call(long_term_stocks, YahooFinance::Client.new)

    if long_term_stocks.reload.any? { |stock| stock.action == LongTermStock::SELL_ACTION }
      NoticesMailer.notify_to_sell(email: email).deliver_later
    end
  end
end
