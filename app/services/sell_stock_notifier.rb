class SellStockNotifier
  include Concerns::Service

  attr_reader :long_term_stocks, :email

  def initialize
    @long_term_stocks = LongTermStock.all
    @email = 'bing708@gmail.com'
  end

  def call
    check_new_york_weekend

    LongTermStockService.call(long_term_stocks)

    if long_term_stocks.reload.any? { |stock| stock.action == LongTermStock::SELL_ACTION }
      NoticesMailer.notify_to_sell(email: email).deliver_later
    end
  end

  private

  def new_york_weekend?
    now = Time.now.in_time_zone("Eastern Time (US & Canada)")
    return true if now.saturday? || now.sunday?
  end

  def check_new_york_weekend
    if new_york_weekend?
      Rails.logger "It's weekend, no trade."
      return
    end
  end
end
