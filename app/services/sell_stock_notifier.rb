# frozen_string_literal: true

class SellStockNotifier
  include Concerns::Service

  attr_reader :long_term_stocks, :email, :stocks_to_notify

  def initialize
    @long_term_stocks = LongTermStock.all
    @email = 'bing708@gmail.com'
  end

  def call
    if new_york_weekend?
      Rails.logger.info "It's weekend, no trade."
      return
    end
    @stocks_to_notify = LongTermStockService.call(long_term_stocks)

    send_notifications
  end

  private

  def new_york_weekend?
    now = Time.now.in_time_zone('Eastern Time (US & Canada)')
    return true if now.saturday? || now.sunday?
  end

  def send_notifications
    return unless stocks_to_notify.any?

    NoticesMailer.notify_to_sell(email: email).deliver_later

    stocks_to_notify.update(notified_at: Time.current)
  end
end
