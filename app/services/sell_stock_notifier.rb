# frozen_string_literal: true

class SellStockNotifier
  include Concerns::Service

  attr_reader :long_term_stocks, :email

  def initialize
    @long_term_stocks = LongTermStock.all
    @email = 'bing708@gmail.com'
  end

  def call
    if new_york_weekend?
      Rails.logger.info "It's weekend, no trade."
      return
    end
    LongTermStockService.call(long_term_stocks)

    NoticesMailer.notify_to_sell(email: email).deliver_later if any_to_sell?
  end

  private

  def new_york_weekend?
    now = Time.now.in_time_zone('Eastern Time (US & Canada)')
    return true if now.saturday? || now.sunday?
  end

  def any_to_sell?
    long_term_stocks.reload.any? { |stock| stock.action == LongTermStock::SELL_ACTION }
  end
end
