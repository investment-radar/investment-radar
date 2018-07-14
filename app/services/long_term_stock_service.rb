# frozen_string_literal: true

class LongTermStockService
  include Concerns::Service

  attr_reader :long_term_stocks

  def initialize(stocks)
    @long_term_stocks = stocks
  end

  def call
    long_term_stocks.each do |long_term_stock|
      result = FinanceClient::DecisionEngine.long_term_stock(long_term_stock.stock_symbol)

      update_long_term_stock(long_term_stock, result) if result.present?
      sleep(30) if Rails.env.production?
    end

    LongTermStock.to_notify
  end

  private

  def update_long_term_stock(long_term_stock, result)
    long_term_stock.update!(action: result['decision'])
  end
end
