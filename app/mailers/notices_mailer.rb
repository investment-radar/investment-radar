# frozen_string_literal: true

class NoticesMailer < ApplicationMailer
  attr_reader :stocks

  def notify_to_sell(email:)
    @stocks = LongTermStock.all

    mail to: email, subject: sell_subject
  end

  private

  def sell_subject
    subject = "(#{Rails.env}) Stock:"

    stocks.each do |stock|
      subject += " #{stock.action}-#{stock.stock_symbol.upcase}"
    end
    logger.info "logger Email subject: #{subject}"

    subject
  end
end
